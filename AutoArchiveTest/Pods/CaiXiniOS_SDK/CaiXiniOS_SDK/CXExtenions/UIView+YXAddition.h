//
//  UIView+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/14.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (YXAddition)

/// 渐变色渐变方向
typedef NS_ENUM(NSInteger, GradientDirection) {
    GradientDirectionToTop    = 1,
    GradientDirectionToLeft   = 2,
    GradientDirectionToBottom = 3,
    GradientDirectionToRight  = 4,
};


@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

/**
 *  9.上 < Shortcut for frame.origin.y
 */
@property (nonatomic, assign) CGFloat top;

/**
 *  10.下 < Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic, assign) CGFloat bottom;

/**
 *  11.左 < Shortcut for frame.origin.x.
 */
@property (nonatomic, assign) CGFloat left;

/**
 *  12.右 < Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic, assign) CGFloat right;

/**
 圆角大小
 */
@property (nonatomic, assign) IBInspectable CGFloat yx_radius;

/**
 边框大小
 */
@property (nonatomic, assign) IBInspectable CGFloat yx_borderWidth;

/**
 边框颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *yx_borderColor;
/**
 阴影大小
 */
@property (nonatomic, assign) IBInspectable CGFloat yx_shadowRadius;
/**
 阴影颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *yx_shadowColor;
/**
 阴影不透明度
 */
@property (nonatomic, assign) IBInspectable CGFloat yx_shadowOpacity;
/**
 阴影偏移量
 */
@property (nonatomic, assign) IBInspectable CGSize yx_shadowOffset;


/**
 快速初始化一个view
 @param frame frame
 @param color color
 @return return value description
 */
+ (instancetype)yx_initViewWithFrame:(CGRect)frame
                               color:(UIColor *)color;

/**
 设置边框
 @param radius 半径
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 */
- (void)yx_borderWithRadius:(CGFloat)radius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor;

/**
 添加单击手势
 */
- (void)yx_addTapGesture:(id)target action:(SEL)action;

/**
 添加阴影
 @param color 阴影颜色
 @param isCell 是否为cell
 */
- (void)yx_addShadowColor:(UIColor *)color isCell:(BOOL)isCell;
/**
 添加圆角
 @param radius 半径
 @param corner 圆角位置
 */
- (void)yx_addCornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)corner;

/**
 获取当前view所在的视图控制器
 @return vc
 */
- (UIViewController *)yx_currentViewController;

/**
 加载xib视图
 @return xib
 */
+ (instancetype)yx_loadFromXib;

/**
 设置渐变色
 @param fromColor 开始颜色
 @param toColor 结束颜色
 @param direction 渐变方向
 */
- (void)yx_gradientBackgroundWithColor:(UIColor *)fromColor
                               toColor:(UIColor *)toColor
                             direction:(GradientDirection)direction;

/**
 设置渐变色
 @param colors 渐变颜色数组
 @param direction 渐变方向
 */
- (void)yx_gradientBackgroundWithColors:(NSArray *)colors
                             direction:(GradientDirection)direction;

- (void)yx_showLoding:(NSString *)string;

- (void)yx_configViewModel:(id)viewModel;
- (void)yx_configViewModel:(id)viewModel indexPath:(NSIndexPath *)indexPath;


@end

