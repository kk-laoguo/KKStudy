//
//  UIView+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/14.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIView+YXAddition.h"

@implementation UIView (YXAddition)


- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin {
    return self.frame.origin;
}

/// top
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
- (CGFloat)top {
    return self.frame.origin.y;
}

/// bottom
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

/// left
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


- (CGFloat)left {
    return self.frame.origin.x;
}

/// right
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
/// radius
- (void)setYx_radius:(CGFloat)yx_radius {
    if (yx_radius <= 0) {
        yx_radius = self.width * 0.5;
    }
    self.layer.cornerRadius = yx_radius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)yx_radius {
    return self.layer.cornerRadius;
}
/// border
- (void)setYx_borderWidth:(CGFloat)yx_borderWidth {
    self.layer.borderWidth = yx_borderWidth;
    
}
- (CGFloat)yx_borderWidth {
    return self.layer.borderWidth;
}
/// border_color
- (void)setYx_borderColor:(UIColor *)yx_borderColor {
    self.layer.borderColor = yx_borderColor.CGColor;
    self.layer.masksToBounds = YES;
}
- (UIColor *)yx_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
/// shadowRadius
- (void)setYx_shadowRadius:(CGFloat)yx_shadowRadius {
    self.layer.shadowRadius = yx_shadowRadius;
}
- (CGFloat)yx_shadowRadius {
    return self.layer.shadowRadius;
}
/// shadowColor
- (void)setYx_shadowColor:(UIColor *)yx_shadowColor {
    self.layer.shadowColor = yx_shadowColor.CGColor;
    
}
- (UIColor *)yx_shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}
/// shadowOpacity
- (void)setYx_shadowOpacity:(CGFloat)yx_shadowOpacity {
    self.layer.shadowOpacity = yx_shadowOpacity;
}
- (CGFloat)yx_shadowOpacity {
    return self.layer.shadowOpacity;
}
/// shadowOffset
- (void)setYx_shadowOffset:(CGSize)yx_shadowOffset {
    self.layer.shadowOffset = yx_shadowOffset;
}
- (CGSize)yx_shadowOffset {
    return self.layer.shadowOffset;
}

#pragma mark - View其他操作
/// 快速初始化一个view
+ (instancetype)yx_initViewWithFrame:(CGRect)frame
                               color:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}
/// 给view设置边框
- (void)yx_borderWithRadius:(CGFloat)radius
                borderWidth:(CGFloat)borderWidth
                borderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
/// 添加单击手势
- (void)yx_addTapGesture:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/// 添加阴影
- (void)yx_addShadowColor:(UIColor *)color isCell:(BOOL)isCell {
    if (!color) {
        color = [UIColor grayColor];
    }
    self.layer.shadowColor = color.CGColor;//shadowColor阴影颜色
    // 4,4
    //.阴影的偏移 CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
    self.layer.shadowOffset = CGSizeMake(0,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    self.layer.shadowRadius = 5;//阴影半径，默认3
    self.layer.masksToBounds = NO;
    //设置了path时cell不可用
    if (!isCell) {
        self.layer.shadowPath = [UIBezierPath  bezierPathWithRect:self.bounds].CGPath;
    }
}


/// 添加圆角
- (void)yx_addCornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)corner {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corner
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}

/// 获取当前view所在的视图控制器
- (UIViewController *)yx_currentViewController {
    //找到view所在的vc
    id object = [self nextResponder];
    while (![object isKindOfClass:[UIViewController class]] && object != nil) {
        object = [object nextResponder];
    }
    return object;
    
//    for (UIView *next = [self superview]; next; next = next.superview) {
//     UIResponder *nextResponder = [next nextResponder];
//     if ([nextResponder isKindOfClass:[UINavigationController class]] ||
//         [nextResponder isKindOfClass:[UIViewController class]]) {
//         return (UIViewController*)nextResponder;
//        }
//    }
//    return nil;
    
}

/// 加载xib视图
+ (instancetype)yx_loadFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}


/// 设置渐变色
- (void)yx_gradientBackgroundWithColor:(UIColor *)fromColor
                               toColor:(UIColor *)toColor
                             direction:(GradientDirection)direction {
    [self yx_gradientBackgroundWithColors:@[fromColor, toColor] direction:direction];
}

- (void)yx_gradientBackgroundWithColors:(NSArray *)colors
                              direction:(GradientDirection)direction {
    CAGradientLayer *la = [[CAGradientLayer alloc]init];
    la.frame = self.bounds;
    [self.layer addSublayer:la];
    
    NSMutableArray *marray = [NSMutableArray array];
    for (UIColor *color in colors) {
        [marray addObject:(__bridge id)color.CGColor];
    }
    la.colors = marray;
    switch (direction) {
        case GradientDirectionToTop:
            la.startPoint = CGPointMake(0.5, 1);
            la.endPoint = CGPointMake(0.5, 0);
            break;
        case GradientDirectionToLeft:
            la.startPoint = CGPointMake(1, 0.5);
            la.endPoint = CGPointMake(0, 0.5);
            break;
        case GradientDirectionToBottom:
            la.startPoint = CGPointMake(0.5, 0);
            la.endPoint = CGPointMake(0.5, 1);
            break;
        case GradientDirectionToRight:
            la.startPoint = CGPointMake(0, 0.5);
            la.endPoint = CGPointMake(1, 0.5);
            break;
    }
}
- (void)yx_showLoding:(NSString *)string {
    
    if (@available(iOS 9.0, *)) {
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[self class]]].color = [UIColor lightGrayColor];
    } else {
        [UIActivityIndicatorView appearanceWhenContainedIn:[self class], nil].color = [UIColor lightGrayColor];
    }
}

- (void)yx_configViewModel:(id)viewModel {}
- (void)yx_configViewModel:(id)viewModel indexPath:(NSIndexPath *)indexPath {}


@end
