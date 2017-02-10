//
//  HUDUtil.h
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/8.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDUtil : NSObject

+ (void)showLoading;
+ (void)showLoading:(NSString *)msg;
+ (void)showLoading:(NSString *)msg isAllowTouch:(BOOL)isAllowTouch;

+ (void)showSuccess:(NSString *)msg;
+ (void)showError:(NSString *)msg;
+ (void)showInfo:(NSString *)msg;

+ (void)hide;
+ (void)hideWithTime:(NSTimeInterval)time;

@end
