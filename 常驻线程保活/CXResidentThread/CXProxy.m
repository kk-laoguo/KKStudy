//
//  CXProxy.m
//  CXResidentThread
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "CXProxy.h"

@interface CXProxy ()
@property (nonatomic, weak) id object;

@end

@implementation CXProxy

+ (instancetype)proxyWithObject:(id)object {

    CXProxy *proxy = [CXProxy alloc];
    proxy.object = object;
    return proxy;
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.object methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    if (self.object) {
        [invocation invokeWithTarget:self.object];
    }
}
@end
