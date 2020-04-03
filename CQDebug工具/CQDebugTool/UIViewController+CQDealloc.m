//
//  UIViewController+CQDealloc.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "UIViewController+CQDealloc.h"
#import "CQDebugStatusBar.h"
#import <ObjC/message.h>
#import "CQDebugTool.h"
@implementation UIViewController (CQDealloc)

#ifdef DEBUG
+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = NSSelectorFromString(@"dealloc");
        SEL swizzledSelector = @selector(CQ_dealloc);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)CQ_dealloc {
    if ([CQDebugTool debugInstance].deallocMessageShow && ![[CQDebugTool debugInstance].ignoreClasss containsObject:NSStringFromClass([self class])]) {
        [CQDebugStatusBar showMessage:[NSString stringWithFormat:@"%@ dealloc!", NSStringFromClass([self class])]];
        NSLog(@"%@",[NSString stringWithFormat:@"%@ dealloc!", NSStringFromClass([self class])]);
    }
    [self CQ_dealloc];
}

#endif

@end
