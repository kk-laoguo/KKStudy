//
//  UILabel+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (YXAddition)

/**
 快速创建UILabel
 @param text 文本
 @param fontSize 字体大小
 @param color 字体颜色
 @return label
 */
+ (instancetype)yx_labelWithText:(NSString *)text
                         fontSize:(CGFloat)fontSize
                            color:(UIColor *)color;
/**
 有删除线的
 @param string string
 */
- (void)yx_delLineStr:(NSString *)string;
/**
 有下划线的
 @param string string
 */
- (void)yx_underlineStr:(NSString *)string;
/**
 设置label的行间距默认为：10
 @param string string
 */
- (void)yx_labelLineSpace:(NSString*)string;
/**
 设置label的行间距
 @param space space
 @param string string
 */
- (void)yx_labeLineSpace:(CGFloat)space string:(NSString*)string;
/**
 设置Html代码格式Str
 @param htmlStr htmlStr
 */
- (void)yx_htmlString:(NSString *)htmlStr;
/**
 设置Html代码格式Str与行高
 @param htmlStr htmlStr
 @param height height
 */
- (void)yx_htmlString:(NSString *)htmlStr labelRowOfHeight:(CGFloat)height;
/**
 获取lab上每行显示的文字
 @return  textArr
 */
- (NSArray *)yx_everyLineText;

/**
 设置指定stirng 颜色
 @param color color description
 @param string 需要设置颜色的string
 */
- (void)yx_attributeColor:(UIColor *)color string:(NSString *)string;

@end

