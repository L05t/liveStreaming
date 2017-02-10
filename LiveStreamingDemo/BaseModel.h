//
//  BaseModel.h
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/10.
//  Copyright © 2017年 武家成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (instancetype)initWithJSONDict:(NSDictionary *)dict;
- (void)initializeWithDict:(NSDictionary *)dict;
@end
