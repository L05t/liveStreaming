//
//  BaseModel.m
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/10.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel
- (instancetype)initWithJSONDict:(NSDictionary *)dict{
    self = [super init];
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if (value != nil) {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)initializeWithDict:(NSDictionary *)dict{
    [self setValuesForKeysWithDictionary:dict];
}


@end
