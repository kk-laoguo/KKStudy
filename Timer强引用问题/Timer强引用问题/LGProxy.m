//
//  LGProxy.m
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "LGProxy.h"

@interface LGProxy ()

@property (nonatomic, weak) id object;

@end

@implementation LGProxy


+ (instancetype)proxyWithObject:(id)object {
    
    LGProxy *proxy = [LGProxy alloc];
    proxy.object = object;
    return proxy;
    
}

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    return self.object;
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (self.object) {
        return [self.object methodSignatureForSelector:sel];
    }
    return nil;
}
- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self.object respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.object];
    }
}
@end
