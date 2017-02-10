//
//  NSString+base64.h
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/10.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (base64)

- (NSString *)base64Encode:(NSString *)string;
- (NSString *)base64Decode:(NSString *)string;

@end
