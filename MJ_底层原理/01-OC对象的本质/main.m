//
//  main.m
//  01-OC对象的本质
//
//  Created by zainguo on 2020/4/2.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa; // arm64 一个isa站8个字节 32位占用4个字节
};
// 指针
//





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        {
            
            NSObject *objc1 = [[NSObject alloc] init];
            Class class1 = [objc1 class];
            Class class2 = object_getClass(objc1);
            Class class3 = [NSObject class];
            NSLog(@"%p, %p, %p", class1, class2, class3);
            
           
            
            
            
            
//            NSObject *obj = [[NSObject alloc] init];
//            // 获得NSObject类的实例对象的成员变量所占用的大小 : 8
//            NSLog(@"%zd", class_getInstanceSize([NSObject class]));
//            // 获得isa指针所指向内存的大小 >> 16
//            NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
            
            // 面试题: 一个NSObject对象占用多少内存?
            // 系统会默认分配16个字节给NSObject对象(malloc_size获取)
            // 但NSObject对象内部只使用了8个字节(用来存放isa)的空间(64bit环境下, 可以通过class_getInstanceSize函数来获取)
        }
    }
    return 0;
}


