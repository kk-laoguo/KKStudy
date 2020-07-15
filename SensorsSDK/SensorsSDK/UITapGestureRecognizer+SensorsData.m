//
//  UITapGestureRecognizer+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UITapGestureRecognizer+SensorsData.h"
#import "NSObject+Swizzler.h"
#import "SensorsAnalyticsSDK.h"

@implementation UITapGestureRecognizer (SensorsData)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yx_swizzleInstanceMethod(self, @selector(initWithTarget:action:), @selector(yx_initWithTarget:action:));
        yx_swizzleInstanceMethod(self, @selector(addTarget:action:), @selector(yx_addTarget:action:));
    });
}
- (instancetype)yx_initWithTarget:(id)target action:(SEL)action {
    // 调用原来的初始化方法
    [self yx_initWithTarget:target action:action];
    [self removeTarget:target action:action];
    // 调用添加target-action方法
    // 这里其实调用的是我们自定义的yx_addTarget:方法
    [self addTarget:target action:action];
    return self;
}
- (void)yx_addTarget:(id)target action:(SEL)action {
    [self yx_addTarget:self action:@selector(trackGestureAppClick:)];
    // 调用原先的方法
    [self yx_addTarget:target action:action];
    
}
- (void)trackGestureAppClick:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    // 暂定只设置支持UILabel 和 UIImageView手势采集以及View
    BOOL isTrakClass = [view isKindOfClass:UILabel.class]
    || [view isKindOfClass:UIImageView.class]
    || [view isKindOfClass:[UIView class]];
    
    if (!isTrakClass) {
        return;
    }
    // 触发$AppClick事件
    [[SensorsAnalyticsSDK shareInstance] trackAppClickWithView:view properties:nil];
}

@end
