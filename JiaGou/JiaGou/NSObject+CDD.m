//
//  NSObject+CDD.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSObject+CDD.h"
#import <objc/runtime.h>
#import "CDDContext.h"


@implementation NSObject (CDD)

- (void)setContext:(CDDContext *)context {
    objc_setAssociatedObject(self, @selector(context), context, OBJC_ASSOCIATION_ASSIGN);
}

- (CDDContext *)context {
    
    CDDContext *curContext = objc_getAssociatedObject(self, @selector(context));
    if (curContext == nil && [self isKindOfClass:[UIView class]]) {
        
        UIView *view = (UIView *)self;
        UIView *superView = view.superview;
        while (superView != nil) {
            if (superView.context != nil) {
                curContext = superView.context;
                break;
            }
            superView = superView.superview;
        }
        if (curContext != nil) {
            [self setContext:curContext];
        }
    }
    return curContext;
}

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel {
    
    Method oldMethod = class_getInstanceMethod([self class], oldSel);
    Method newMethod = class_getInstanceMethod([self class], newSel);
    if (!oldMethod || !newMethod)
    {
        return;
    }
    
    class_addMethod(self,
                    oldSel,
                    class_getMethodImplementation(self, oldSel),
                    method_getTypeEncoding(oldMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, oldSel),
                                   class_getInstanceMethod(self, newSel));
}
@end
