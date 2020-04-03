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

#import "CQDebug.h"
#import "CQUrlContext.h"

FOUNDATION_EXPORT double CQDebugToolVersionNumber;
FOUNDATION_EXPORT const unsigned char CQDebugToolVersionString[];

