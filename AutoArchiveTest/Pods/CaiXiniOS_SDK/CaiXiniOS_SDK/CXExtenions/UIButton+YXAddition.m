//
//  UIButton+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIButton+YXAddition.h"
#import <objc/runtime.h>


static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

static const NSTimeInterval DefaultInterval = 1;

@implementation UIButton (YXAddition)

// 重写 防止button连点
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    [super sendAction:action to:target forEvent:event];
    self.yx_eventInterval == 0 ? self.yx_eventInterval = DefaultInterval : self.yx_eventInterval;
    self.userInteractionEnabled = false;
    // 延迟1秒执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.yx_eventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = true;
    });
}
//
//+ (void)load {
//    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method yx_method = class_getInstanceMethod(self, @selector(yx_sendAction:to:forEvent:));
//    method_exchangeImplementations(method, yx_method);
//}
//- (void)yx_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    [self yx_sendAction:action to:target forEvent:event];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.yx_eventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    });
//}

+ (UIButton *(^)(void))yx_initButton {
    return ^(){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        return button;
    };
}

- (UIButton *(^)(NSString *))normalTitle {
    return ^UIButton *(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *))selectedTitle {
    return ^UIButton *(NSString *selectedTitle) {
        [self setTitle:selectedTitle forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIColor *))normalTitleColor {
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *))selectedTitleColor {
    return ^UIButton *(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(CGFloat))titleFont {
    return ^UIButton *(CGFloat font) {
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

- (UIButton *(^)(UIImage *))normalImage {
    return ^UIButton *(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *))selectedImage {
    return ^UIButton *(UIImage *image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

#pragma mark - bvutton初始化及其他操作

- (void)yx_buttonUserInteractionEnabled {
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
}

+ (instancetype)yx_textButton:(NSString *)title
                  fontSize:(CGFloat)fontSize
               normalColor:(UIColor *)normalColor
              selectdColor:(UIColor *)selectdColor {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectdColor forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button sizeToFit];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}
+ (instancetype)yx_textButton:(NSString *)title
                     fontSize:(CGFloat)fontSize
                  normalColor:(UIColor *)normalColor
             highlightedColor:(UIColor *)highlightedColor {
    

    return [self yx_textButton:title
                      fontSize:fontSize
                   normalColor:normalColor
              highlightedColor:highlightedColor
           backgroundImageName:@""];
    
}

+ (instancetype)yx_textButton:(NSString *)title
                     fontSize:(CGFloat)fontSize
                  normalColor:(UIColor *)normalColor
             highlightedColor:(UIColor *)highlightedColor
          backgroundImageName:(NSString *)backgroundImageName {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.adjustsImageWhenHighlighted = NO;
    
    if (backgroundImageName) {
        [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
        NSString *backgroundImageNameHL = [backgroundImageName stringByAppendingString:@"_highlighted"];
        [button setBackgroundImage:[UIImage imageNamed:backgroundImageNameHL] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    return button;
    
}


+ (instancetype)yx_imageButton:(NSString *)imageName
           backgroundImageName:(NSString *)backgroundImageName {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    NSString *imageNameHL = [imageName stringByAppendingString:@"_highlighted"];
    [button setImage:[UIImage imageNamed:imageNameHL] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    
    NSString *backgroundImageNameHL = [backgroundImageName stringByAppendingString:@"_highlighted"];
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageNameHL] forState:UIControlStateHighlighted];
    [button sizeToFit];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

+ (instancetype)yx_imageButton:(NSString *)imageName
             selectedImageName:(NSString *)selectedImageName {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button sizeToFit];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

- (void)yx_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space {
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case ButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case ButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case ButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
}
/// 扩大buuton点击范围
- (void)yx_enlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left {
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

///区域获取
- (CGRect)pm_enlargedRect {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge &&
        rightEdge &&
        bottomEdge &&
        leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event {
    CGRect rect = [self pm_enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


- (void)yx_startWithTime:(NSInteger)timeLine
                   title:(NSString *)title
          countDownTitle:(NSString *)subTitle
               mainColor:(UIColor *)mColor
              countColor:(UIColor *)color {
    
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    //全局队列    默认优先级
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次 NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //倒计时结束，关闭
            if (timeOut <= 0) {
                dispatch_source_cancel(_timer);
                [self setTitle:title ? title:@"获取验证码" forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                [self setTitleColor:mColor forState:UIControlStateNormal];
                self.layer.borderColor = mColor.CGColor;
            }
            else {
                int seconds = timeOut % 60;
                NSString *timeStr = [NSString stringWithFormat:@"%.2d", seconds];
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle ? subTitle:@"S"] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                [self setTitleColor:color forState:UIControlStateNormal];
                self.layer.borderColor = color.CGColor;
                timeOut--;
            }
        });
    });
    dispatch_resume(_timer);
    
}

- (NSTimeInterval)yx_eventInterval {
    return [objc_getAssociatedObject(self, @selector(yx_eventInterval)) doubleValue];
}
- (void)setYx_eventInterval:(NSTimeInterval)yx_eventInterval {
    objc_setAssociatedObject(self, @selector(yx_eventInterval), @(yx_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

@end
