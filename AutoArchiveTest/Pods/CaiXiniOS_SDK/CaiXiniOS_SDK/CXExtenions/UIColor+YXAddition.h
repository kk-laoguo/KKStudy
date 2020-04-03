//
//  UIColor+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YXAddition)

/**
 获取颜色
 @param hex 进制无符号32位整数
 @param alpha alpha
 @return color
 */
+ (UIColor *)yx_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;
/**
 *  获取颜色 含有alpha
 *  @param color 6位16进制字符串
 *  @param alpha 透明度
 *  @return 颜色
 */
+ (UIColor *)yx_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/**
 *  获取颜色
 *  @param color 6位16进制字符串
 *  @return 颜色
 */
+ (UIColor *)yx_colorWithHexString:(NSString *)color;
/**
 随机色
 */
+ (UIColor *)yx_randomColor;
/**
 *  根据图片获取图片的主色调
 */
+ (UIColor*)yx_imageColor:(UIImage*)image;



@end

NS_ASSUME_NONNULL_END
