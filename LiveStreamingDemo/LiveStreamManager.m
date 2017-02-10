//
//  LiveStreamManager.m
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/1/29.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import "LiveStreamManager.h"
#import "HUDUtil.h"
#import "ConfigDefin.h"
#define kvideoSizeVertical CGSizeMake(375,667)

@interface LiveStreamManager ()<PLMediaStreamingSessionDelegate>

@property (nonatomic, strong) PLVideoStreamingConfiguration *videoStreamingConfiguration;//设置视频config

@end

@implementation LiveStreamManager

- (void)initLiveStreamConfig:(successBlock)param{
    DefineWeakSelf(self);
    //高质量
    void(^setHiQ)(void) = ^{
        _videoStreamingConfiguration = [[PLVideoStreamingConfiguration alloc] initWithVideoSize:kvideoSizeVertical expectedSourceVideoFrameRate:30 videoMaxKeyframeInterval:90 averageVideoBitRate:800 * 1000 videoProfileLevel:AVVideoProfileLevelH264Baseline31 videoEncoderType:PLH264EncoderType_VideoToolbox];
        NSLog(@"%s_%d_| averageVideoBitRate : %d",__FUNCTION__, __LINE__,800);
    };
    
    //中质量
    void(^setMidQ)(void) = ^{
        _videoStreamingConfiguration = [[PLVideoStreamingConfiguration alloc] initWithVideoSize:kvideoSizeVertical expectedSourceVideoFrameRate:30 videoMaxKeyframeInterval:90 averageVideoBitRate:600 * 1000 videoProfileLevel:AVVideoProfileLevelH264Baseline31 videoEncoderType:PLH264EncoderType_VideoToolbox];
        NSLog(@"%s_%d_| averageVideoBitRate : %d",__FUNCTION__, __LINE__,600);
    };
    
    //低质量
    void(^setLowQ)(void) = ^{
        _videoStreamingConfiguration = [[PLVideoStreamingConfiguration alloc] initWithVideoSize:kvideoSizeVertical expectedSourceVideoFrameRate:30 videoMaxKeyframeInterval:90 averageVideoBitRate:400 * 1000 videoProfileLevel:AVVideoProfileLevelH264Baseline31 videoEncoderType:PLH264EncoderType_VideoToolbox];
        NSLog(@"%s_%d_| averageVideoBitRate : %d",__FUNCTION__, __LINE__,400);
    };

    void(^defaultQ)(void) = ^{
        weakSelf.videoStreamingConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
    };
    // 摄像头权限
    void(^permissionBlock)(void) = ^{
        weakSelf.sessionQueue = dispatch_queue_create("pili.queue.streaming", DISPATCH_QUEUE_SERIAL);
        PLVideoCaptureConfiguration * videoConfig = [PLVideoCaptureConfiguration defaultConfiguration];
        PLAudioCaptureConfiguration * audioConfig = [PLAudioCaptureConfiguration defaultConfiguration];
        PLAudioStreamingConfiguration * audioStreamingConfig = [PLAudioStreamingConfiguration defaultConfiguration];
        PLStream * stream = [[PLStream alloc] init];//一般设置为nil
        if (weakSelf.streamType == LowQ) {
            setLowQ();
        }else if(weakSelf.streamType == MidQ){
            setMidQ();
        }else if(weakSelf.streamType == HiQ){
            setHiQ();
        }else{
            defaultQ();
        }
        
        weakSelf.StreamingSession = [[PLMediaStreamingSession alloc] initWithVideoCaptureConfiguration:videoConfig audioCaptureConfiguration:audioConfig videoStreamingConfiguration:_videoStreamingConfiguration audioStreamingConfiguration:audioStreamingConfig stream:nil];
        weakSelf.StreamingSession.videoOrientation =(AVCaptureVideoOrientation)AVCaptureVideoOrientationLandscapeRight;
        weakSelf.StreamingSession.delegate = self;
    };
    // 没有权限
    void (^noAccessBlock)(void) = ^{
        [HUDUtil showError:@"没获得摄像头或者麦克风的使用权限!请打开权限再使用"];
    };

    /**
     * 获取摄像头权限
     * @param handler 该 block 将会在主线程中回调。
     */

    switch ([PLMediaStreamingSession cameraAuthorizationStatus]) {
        case PLAuthorizationStatusAuthorized:
            permissionBlock();
            break;
        case PLAuthorizationStatusNotDetermined: {
            [PLMediaStreamingSession requestCameraAccessWithCompletionHandler:^(BOOL granted) {
                granted ? permissionBlock() : noAccessBlock();
            }];
        }
            break;
        default:
            noAccessBlock();
            break;
    }
    
    /**
     * 获取摄像头权限
     * @param handler 该 block 将会在主线程中回调。
     */
    switch ([PLMediaStreamingSession microphoneAuthorizationStatus]) {
        case PLAuthorizationStatusAuthorized:
            break;
        case PLAuthorizationStatusNotDetermined:{
            [PLMediaStreamingSession requestMicrophoneAccessWithCompletionHandler:^(BOOL granted) {
                granted ? permissionBlock() : noAccessBlock();
            }];
        }
            break;
        default:
            
            break;
    }
    

}

// 开始推流
- (void)startSession:(NSURL *)streamURL {
    DefineWeakSelf(self);
    dispatch_async(self.sessionQueue, ^{
        [weakSelf.StreamingSession startStreamingWithPushURL:streamURL feedback:^(PLStreamStartStateFeedback feedback) {
            dispatch_async(dispatch_get_main_queue(), ^{
            });
        }];
    });
}


//水印
- (void)setWaterMark:(UIImage *)image position:(CGPoint)position{
    [self.StreamingSession setWaterMarkWithImage:image position:position];
}



@end
