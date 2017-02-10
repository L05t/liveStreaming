//
//  LiveStreamManager.h
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/1/29.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PLMediaStreamingSession.h>

typedef enum {
    HiQ,
    MidQ,
    LowQ,
}StreamType;

typedef void(^successBlock)(BOOL param);
typedef void(^failedBlock)(BOOL param);

@interface LiveStreamManager : NSObject

@property (nonatomic, strong) PLMediaStreamingSession  *StreamingSession; //推流核心类
@property (nonatomic, strong) dispatch_queue_t sessionQueue;//推流队列
@property (nonatomic, strong) NSArray<PLVideoStreamingConfiguration *> *videoStreamingConfigurations; //视频设置数组
@property (nonatomic, assign) StreamType streamType;

- (void)startSession:(NSURL *)streamURL;
@end
