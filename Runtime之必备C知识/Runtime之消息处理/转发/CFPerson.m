//
//  CFPerson.m
//  转发
//
//  Created by zainguo on 2019/7/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFPerson.h"
#import "CFStudent.h"

@implementation CFPerson
//吃东西
- (void)eating;
{
    NSLog(@"Person eating！");
}
//生成对应的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == NSSelectorFromString(@"playing")) {
//        return [NSMethodSignature methodSignatureForSelector:@selector(eating)];
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    if (aSelector == NSSelectorFromString(@"studying")) {
        //        return [NSMethodSignature methodSignatureForSelector:@selector(eating)];
        return [[CFStudent new] methodSignatureForSelector:@selector(studying)];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == NSSelectorFromString(@"playing")) {
        //1.改变执行的函数
        anInvocation.selector = @selector(eating);
        [anInvocation invokeWithTarget:self];
    }
    if (anInvocation.selector == NSSelectorFromString(@"studying")) {
        //2.改变执行的目标
        [anInvocation invokeWithTarget:[CFStudent new]];
    }
}
@end
