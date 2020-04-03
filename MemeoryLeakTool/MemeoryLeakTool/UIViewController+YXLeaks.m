//
//  UIViewController+YXLeaks.m
//  MemeoryLeakTool
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIViewController+YXLeaks.h"
#import "NSObject+YXLeaks.h"
#import <objc/runtime.h>

const void* const kLGHasBeenPoppedKey = &kLGHasBeenPoppedKey;

@implementation UIViewController (YXLeaks)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self yx_swizzleOriginalInstanceMethod:@selector(viewWillAppear:) withTargetInstanceMethod:@selector(yx_viewWillAppear:)];
        [self yx_swizzleOriginalInstanceMethod:@selector(viewDidDisappear:) withTargetInstanceMethod:@selector(yx_viewDidDisappear:)];
    });
}

- (void)yx_viewWillAppear:(BOOL)animated {
    [self yx_viewWillAppear:animated];
    objc_setAssociatedObject(self, kLGHasBeenPoppedKey, @(NO), OBJC_ASSOCIATION_ASSIGN);
    
}


- (void)yx_viewDidDisappear:(BOOL)animated {
    [self yx_viewDidDisappear:animated];
    if ([objc_getAssociatedObject(self, kLGHasBeenPoppedKey) boolValue]) {
        [self yx_willDealloc];
    }
}

@end
