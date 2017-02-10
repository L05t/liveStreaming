//
//  ConfigDefin.h
//  LiveStreamingDemo
//
//  Created by 武家成 on 2017/2/10.
//  Copyright © 2017年 武家成. All rights reserved.
//

#ifndef ConfigDefin_h
#define ConfigDefin_h

#pragma mark - 常量及方法
//获取屏幕 宽度、高度
#define SCREEN_WIDTH        ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT       ([UIScreen mainScreen].bounds.size.height)
// 屏幕的size
#define SCREENSIZE          ([UIScreen mainScreen].bounds.size)

//NavBar高度
#define NavBar_HEIGHT       64

#define UIColorFromRGBHEX(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBAlphaHex(rgbValue,aValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:aValue]

//带有RGBA的颜色设置
#define UICOLORRGBA(R, G, B, A)     [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UICOLORRGB(R, G, B)         UICOLORRGBA(R,G,B,1.0f)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)



#ifdef DEBUG
#define LRLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define LRLog(format, ...)
#endif

#define DefineWeakSelf(class)  __weak __typeof(class) weakSelf = class


#endif /* ConfigDefin_h */
