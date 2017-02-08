#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "amf.h"
#import "bytes.h"
#import "dhgroups.h"
#import "error.h"
#import "http.h"
#import "log.h"
#import "rtmp.h"
#import "rtmp_sys.h"

FOUNDATION_EXPORT double pili_librtmpVersionNumber;
FOUNDATION_EXPORT const unsigned char pili_librtmpVersionString[];

