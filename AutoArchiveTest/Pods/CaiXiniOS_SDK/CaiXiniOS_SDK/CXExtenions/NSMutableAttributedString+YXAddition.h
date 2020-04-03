//
//  NSMutableAttributedString+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (YXAddition)

/**
 初始化AttributedString
 */
+ (NSMutableAttributedString *(^)(NSString *))yx_initAttributeString;

/**
 AttributedString字体大小
 */
- (NSMutableAttributedString *(^)(CGFloat))attributedFontSize;

/**
 AttributedString字体颜色
 */
- (NSMutableAttributedString *(^)(UIColor *))attributedColor;

/**
 AttributedString字体行间距
 */
- (NSMutableAttributedString *(^)(CGFloat))attributedLineSpace;

/**
 设置指定位置字体颜色
 */
- (NSMutableAttributedString *(^)(UIColor * , NSRange))attributedRangeColor;

/**
 设置指定位置字体大小
 */
- (NSMutableAttributedString *(^)(CGFloat, NSRange))attributedRangeFontSize;

/**
 设置指定位置字体大小, 加粗
 */
- (NSMutableAttributedString *(^)(CGFloat, NSRange))attributeRangeBoldFontSize;



@end

NS_ASSUME_NONNULL_END
