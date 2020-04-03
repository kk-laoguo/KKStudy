//
//  UINavigationController+YXLeaks.m
//  MemeoryLeakTool
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UINavigationController+YXLeaks.h"

#import "NSObject+YXLeaks.h"
#import <objc/runtime.h>

extern const void* const kLGHasBeenPoppedKey;


@implementation UINavigationController (YXLeaks)


+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self yx_swizzleOriginalInstanceMethod:@selector(popViewControllerAnimated:) withTargetInstanceMethod:@selector(yx_popViewControllerAnimated:)];
    });
}
- (UIViewController *)yx_popViewControllerAnimated:(BOOL)animated {
    
    UIViewController *popVc = [self yx_popViewControllerAnimated:animated];
    objc_setAssociatedObject(popVc, kLGHasBeenPoppedKey, @(YES), OBJC_ASSOCIATION_ASSIGN);
    return popVc;
}

@end
