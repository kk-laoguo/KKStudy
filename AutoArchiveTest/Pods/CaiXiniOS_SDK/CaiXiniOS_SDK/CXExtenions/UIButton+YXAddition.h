//
//  UIButton+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (YXAddition)

typedef NS_ENUM(NSInteger,ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleTop, // image在上，label在下
    ButtonEdgeInsetsStyleLeft, // image在左，label在右
    ButtonEdgeInsetsStyleBottom, // image在下，label在上
    ButtonEdgeInsetsStyleRight // image在右，label在左
};
/**
 按钮点击间隔时间
 */
@property (nonatomic, assign) NSTimeInterval yx_eventInterval;
/**
 创建button
 */
+ (UIButton *(^)(void))yx_initButton;
/**
 设置button常规状态下的文字
 */
- (UIButton *(^)(NSString *))normalTitle;
/**
 设置button选中状态下文字
 */
- (UIButton *(^)(NSString *))selectedTitle;
/**
 设置button常规状态下文字颜色
 */
- (UIButton *(^)(UIColor *))normalTitleColor;
/**
 设置button选中状态下颜色
 */
- (UIButton *(^)(UIColor *))selectedTitleColor;
/**
 设置字体颜色
 */
- (UIButton *(^)(CGFloat))titleFont;
/**
 设置按钮常规图片
 */
- (UIButton *(^)(UIImage *))normalImage;
/**
 设置按钮选中图片
 */
- (UIButton *(^)(UIImage *))selectedImage;

/**
 延迟1秒交互
 */
- (void)yx_buttonUserInteractionEnabled;
/**
 创建文本button
 @param title title description
 @param fontSize fontSize description
 @param normalColor normalColor description
 @param selectdColor selectdColor description
 @return return value description
 */
+ (instancetype)yx_textButton:(NSString *)title
                   fontSize:(CGFloat)fontSize
                normalColor:(UIColor *)normalColor
               selectdColor:(UIColor *)selectdColor;
/**
 创建文本button
 @param title 标题文字
 @param fontSize 字体大小
 @param normalColor 默认颜色
 @param highlightedColor 高亮颜色
 @return button
 */
+ (instancetype)yx_textButton:(NSString *)title
                      fontSize:(CGFloat)fontSize
                   normalColor:(UIColor *)normalColor
              highlightedColor:(UIColor *)highlightedColor;
/**
 创建文本按钮 + 背景图片
 
 @param title 标题文字
 @param fontSize 字体大小
 @param normalColor  默认颜色
 @param highlightedColor 高亮颜色
 @param backgroundImageName 高亮颜色
 @return button
 */
+ (instancetype)yx_textButton:(NSString *)title
                      fontSize:(CGFloat)fontSize
                   normalColor:(UIColor *)normalColor
              highlightedColor:(UIColor *)highlightedColor
           backgroundImageName:(NSString *)backgroundImageName;
/**
 创建图像按钮
 
 @param imageName  图像名称
 @param backgroundImageName 背景图像名称
 @return button
 */
+ (instancetype)yx_imageButton:(NSString *)imageName
            backgroundImageName:(NSString *)backgroundImageName;

+ (instancetype)yx_imageButton:(NSString *)imageName
              selectedImageName:(NSString *)selectedImageName;
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)yx_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                            imageTitleSpace:(CGFloat)space;
/**
 扩大buuton点击范围
 @param top top description
 @param right right description
 @param bottom bottom description
 @param left left description
 */
- (void)yx_enlargeEdgeWithTop:(CGFloat)top
                         right:(CGFloat)right
                        bottom:(CGFloat)bottom
                          left:(CGFloat)left;

/**
 *  倒计时按钮
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)yx_startWithTime:(NSInteger)timeLine
                    title:(NSString *)title
           countDownTitle:(NSString *)subTitle
                mainColor:(UIColor *)mColor
               countColor:(UIColor *)color;




@end

