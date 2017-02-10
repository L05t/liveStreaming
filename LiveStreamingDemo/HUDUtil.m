//
//  HUDUtil.m
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/8.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import "HUDUtil.h"
#import "SVProgressHUD.h"
@implementation HUDUtil


+ (void)showLoading {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [SVProgressHUD show];
}

+ (void)showLoading:(NSString *)msg {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:msg];
}

+ (void)showLoading:(NSString *)msg isAllowTouch:(BOOL)isAllowTouch {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    if (isAllowTouch) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    } else {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
    [SVProgressHUD showWithStatus:msg];
}

+ (void)showSuccess:(NSString *)msg {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showSuccessWithStatus:msg];
}

+ (void)showError:(NSString *)msg {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showErrorWithStatus:msg];
}

+ (void)showInfo:(NSString *)msg {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showInfoWithStatus:msg];
}

+ (void)hide {
    //    [SVProgressHUD popActivity];
    [SVProgressHUD dismiss];
}

+ (void)hideWithTime:(NSTimeInterval)time
{
    [SVProgressHUD dismissWithDelay:5.0];
}






@end
