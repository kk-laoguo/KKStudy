//
//  Person.m
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Person.h"
#import "Man.h"


#import <objc/runtime.h>

//#define YXTailMask 1
//#define YXRichMask 2
//#define YXHandsomeMask 4

//#define YXTailMask 0b00000001
//#define YXRichMask 0b00000010
//#define YXHandsomeMask 0b00000100

#define YXTailMask (1<<0)
#define YXRichMask (1<<1)
#define YXHandsomeMask (1<<2)



@interface Person ()
{
    char _tailRichHandsome; // 0b 0000 0000
}

@end
@implementation Person

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        // 返回方法签名: 返回返回值类型/参数类型
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}
// 封装了方法的实现
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"这里可以自由发挥....");
    
    // 或者转发给Man实现
//    [anInvocation invokeWithTarget:[[Man alloc] init]];
    
}

- (instancetype)init {
    if (self = [super init]) {
        _tailRichHandsome = 0b0000011;
    }
    return self;
}

- (void)setTail:(BOOL)tail {
    if (tail ) {
        _tailRichHandsome |= YXTailMask;
    } else {
        _tailRichHandsome &= ~YXTailMask;
    }
    
}
- (BOOL)isTail {
    
    return _tailRichHandsome & YXTailMask;
}

- (void)setRich:(BOOL)rich {
    if (rich ) {
        _tailRichHandsome |= YXRichMask;
    } else {
        _tailRichHandsome &= ~YXRichMask;
    }
}
- (BOOL)isRich {
//    !!(2)
    return !!(_tailRichHandsome & YXRichMask);
}


- (void)setHandsome:(BOOL)handsome {
    if (handsome ) {
          _tailRichHandsome |= YXHandsomeMask;
      } else {
          _tailRichHandsome &= ~YXHandsomeMask;
      }
}
- (BOOL)isHandsome {
//    return !!(_tailRichHandsome & 4);
    return !!(_tailRichHandsome & YXHandsomeMask);

}
@end
