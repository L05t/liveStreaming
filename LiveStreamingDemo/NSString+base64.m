//
//  NSString+base64.m
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/10.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import "NSString+base64.h"

@implementation NSString (base64)

- (NSString *)base64Encode:(NSString *)string{
    NSData *endcodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [endcodeData base64EncodedStringWithOptions:0];
}

- (NSString *)base64Decode:(NSString *)string{
    NSData * decodeData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
}

@end
