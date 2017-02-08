//
//  LiveStreamManager.m
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/1/29.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import "LiveStreamManager.h"
@interface LiveStreamManager ()<PLMediaStreamingSessionDelegate>

@end

@implementation LiveStreamManager

- (void)initLiveStreamConfig:(successBlock)param{
    
    self.sessionQueue = dispatch_queue_create("pili.queue.streaming", DISPATCH_QUEUE_SERIAL);
    PLVideoCaptureConfiguration * videoConfig = [PLVideoCaptureConfiguration defaultConfiguration];
    PLAudioCaptureConfiguration * audioConfig = [PLAudioCaptureConfiguration defaultConfiguration];
    PLVideoStreamingConfiguration * videoStreamingConfig = [PLVideoStreamingConfiguration defaultConfiguration];
    PLAudioStreamingConfiguration * audioStreamingConfig = [PLAudioStreamingConfiguration defaultConfiguration];
    PLStream * stream = [[PLStream alloc] init];//一般设置为nil
    
    self.StreamingSession = [[PLMediaStreamingSession alloc] initWithVideoCaptureConfiguration:videoConfig audioCaptureConfiguration:audioConfig videoStreamingConfiguration:videoStreamingConfig audioStreamingConfiguration:audioStreamingConfig stream:nil];
    self.StreamingSession.videoOrientation =(AVCaptureVideoOrientation)AVCaptureVideoOrientationLandscapeRight;
    self.StreamingSession.delegate = self;
    
    // 摄像头权限
    void(^permissionBlock)(void) = ^{
        dispatch_async(self.sessionQueue, ^{
            
        });
    };
    // 没有权限
    void (^noAccessBlock)(void) = ^{
        
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
    dispatch_async(self.sessionQueue, ^{
        [self.StreamingSession startStreamingWithPushURL:streamURL feedback:^(PLStreamStartStateFeedback feedback) {
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
