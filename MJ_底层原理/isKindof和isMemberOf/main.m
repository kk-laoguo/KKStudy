//
//  main.m
//  isKindof和isMemberOf
//
//  Created by zainguo on 2020/5/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         Class object_getClass(id obj)
         {
             if (obj) return obj->getIsa();
             else return Nil;
         }
         + (Class)class {
             return self;
         }

         - (Class)class {
             return object_getClass(self);
         }

         + (Class)superclass {
             return self->superclass;
         }

         - (Class)superclass {
             return [self class]->superclass;
         }

         + (BOOL)isMemberOfClass:(Class)cls {
             return object_getClass((id)self) == cls;
         }

         - (BOOL)isMemberOfClass:(Class)cls {
             return [self class] == cls;
         }

         + (BOOL)isKindOfClass:(Class)cls {
             for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
                 if (tcls == cls) return YES;
             }
             return NO;
         }

         - (BOOL)isKindOfClass:(Class)cls {
             for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
                 if (tcls == cls) return YES;
             }
             return NO;
         }
         
         */
        Person *p = [Person new];
        // + (BOOL)isKindOfClass:(Class)cls
        // 看源码可知: 内部会先去获得object_getClass的类
        // 而object_getClass的源码实现是去调用当前类的obj->getIsa()，最后在ISA()方法中获得meta class的指针。
        // 接着在isKindOfClass中有一个循环, 先判断class是否等于meta class，不等就继续循环判断是否等于super class，不等再继续取super class，如此循环下去。
        // [NSObject class]执行完之后调用isKindOfClass, 第一次判断先判断NSObject 和 NSObject的meta class是否相等, 之前讲到meta class的时候放了一张很详细的图，从图上我们也可以看出，NSObject的meta class与本身不等。接着第二次循环判断NSObject与meta class的superclass是否相等。
        // 还是从那张图上面我们可以看到：Root class(meta) 的superclass 就是 Root class(class)，也就是NSObject本身。所以第二次循环相等，于是第一行res1输出应该为YES。

        NSLog(@"------->: %d", [[NSObject class] isKindOfClass:[NSObject class]]);
        /*
         isMemberOfClass的源码实现是拿到自己的isa指针和自己比较，是否相等。
         第二行isa 指向 NSObject 的 Meta Class，所以和 NSObject Class不相等。第四行，isa指向Sark的Meta Class，和Sark Class也不等，所以第二行res2和第四行res4都输出NO。

         */
        NSLog(@"------->: %d", [[NSObject class] isMemberOfClass:[NSObject class]]);
        /*
         同理，[Person class]执行完之后调用isKindOfClass，第一次for循环，Person的Meta Class与[Person class]不等，第二次for循环，Person Meta Class的super class 指向的是 NSObject Meta Class， 和 Person Class不相等。第三次for循环，NSObject Meta Class的super class指向的是NSObject Class，和 Person Class 不相等。第四次循环，NSObject Class 的super class 指向 nil， 和 Person Class不相等。第四次循环之后，退出循环，所以输出为NO。
         
         如果把这里的Person改成它的实例对象，[p isKindOfClass:[Person class]，那么此时就应该输出YES了。因为在isKindOfClass函数中，判断p的isa指向是否是自己的类Person，第一次for循环就能输出YES了。

         */
        NSLog(@"------->: %d", [[Person class] isKindOfClass:[Person class]]);
        NSLog(@"------->: %d", [[Person class] isMemberOfClass:[Person class]]);
    }
    return 0;
}
