//
//  CaiXinMacro.h
//  CaiXinSDKExample
//
//  Created by zainguo on 2019/4/28.
//  Copyright © 2019 zainguo. All rights reserved.
//


#import "CaiXinDeviceInline.h"

#ifndef CaiXinMacro_h
#define CaiXinMacro_h


#define kSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define kScale_Width(width)     (width * (kSCREEN_WIDTH/375.0))
#define kScale_Height(height)   (height * ((kSCREEN_HEIGHT - kBOTTOM_SAFE_HEIGHT)/667.0))

#define kNAVIBAR_HEIGHT         (isIPhoneX() ? 88 : 64)
#define kSTATUSBAR_HEIGHT       (isIPhoneX() ? 44 : 20)
#define kBOTTOM_SAFE_HEIGHT     (isIPhoneX() ? 34 : 0)
#define kTABBAR_HEIGHT          (isIPhoneX() ? 83 : 49)

#define iPhone4_Screen          (KSCREENH_HEIGHT == 480 ? 1 : 0)
#define iPhone5_Screen          (KSCREENH_HEIGHT == 568 ? 1 : 0)
#define iPhone6_Screen          (KSCREEN_WIDTH == 375 ? 1 : 0)
#define iPhone6Plus_Screen      (KSCREEN_WIDTH == 414 ? 1 : 0)
#define iPhoneX_Screen          (kSCREEN_HEIGHT == 812 ? 1 : 0)

// window
#define kWindow                 [UIApplication sharedApplication].keyWindow
// NSUserDefaults
#define kNSUSERDEFAULTS         [NSUserDefaults standardUserDefaults]
// 加载xib
#define kNIB(x)                 [UINib nibWithNibName:x bundle:nil]

#define kStringFormClass(_CLASS_) NSStringFromClass([_CLASS_ class])

#define kClassFromString(_STR_) NSClassFromString(_STR_)

#define kIMAGE_URL(_URL_,_WIDTH_,_HEIGHT_) [NSString stringWithFormat:@"%@?x-oss-process=image/resize,m_fill,h_%d,w_%d",_URL_,_HEIGHT_,_WIDTH_]

#define kNSStringFormat(format,...)  [NSString stringWithFormat:format,##__VA_ARGS__]

#define kAppendingString(_STR_, _APPENDING_) [NSString stringWithFormat:@"%@%@",_STR_,_APPENDING_]

#define kAmountString(_amount_)  [NSString stringWithFormat:@"¥%.2f", _amount_]

#define kAmount(_amount_)  [NSString stringWithFormat:@"%.2f", _amount_]
/**
 *  快速设置 point
 */
#define POINT(_X_,_Y_) CGPointMake(_X_, _Y_)
/**
 *  快速设置 rect
 */
#define RECT(_X_,_Y_,_W_,_H_) CGRectMake(_X_, _Y_, _W_, _H_)
/**
 *  快速设置 size
 */
#define SIZE(_W_,_H_) CGSizeMake(_W_, _H_)
/**
 *  快速设置 bounds
 */
#define BOUNDS(_X_,_Y_,_W_,_H_) CGRectMake(0, 0, _W_, _H_)
/**
 *  快速设置 range
 */
#define RANGE(_location_,_length_) NSMakeRange(_location_,_length_)
/**
 *  快速配置 imageName
 */
#define IMAGE(_IMAGE_)  [UIImage imageNamed:_IMAGE_]
/**
 *  快速设置 font
 */
#define FONT(_SIZE_) [UIFont systemFontOfSize:_SIZE_]
/**
 *  快速设置 MediumFont
 */
#define MediumFont(_SIZE_) [UIFont systemFontOfSize:_SIZE_ weight:UIFontWeightMedium]
/**
 *  快速设置 font
 */
#define PingFangSCRegular(_SIZE_) [UIFont fontWithName:@"PingFangSC-Regular" size:_SIZE_]
/**
 *  快速设置 font
 */
#define PingFangSCBold(_SIZE_) [UIFont fontWithName:@"PingFangSC-Semibold" size:_SIZE_]

// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

// NSLog宏
#ifdef DEBUG //处于开发阶段
#define KLOG(...) NSLog(@"%s %d\n %@\n\n", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else //处于发布阶段
#define KLOG(...)
#endif


// 这是一个MRC/ARC通用的weakify和strongify
/**
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@weakify_self`实现弱引用转换，`@strongify_self`实现强引用转换
 *
 * 示例：
 * @weakify_self
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef    weakify_self
#if __has_feature(objc_arc)
#define weakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define weakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif


#ifndef    strongify_self
#if __has_feature(objc_arc)
#define strongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define strongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif



#endif /* CaiXinMacro_h */
