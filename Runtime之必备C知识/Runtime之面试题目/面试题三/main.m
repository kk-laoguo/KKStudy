//
//  main.m
//  面试题三
//
//  Created by zainguo on 2019/7/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CFPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        class_addIvar([CFPerson class], "age", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
//        CFPerson *person = [CFPerson new];
//        [person setValue:@"100" forKey:@"age"];
//        NSLog(@"%@",[person valueForKey:@"age"]);
        
        /// 运行时创建的类
        Class cls = objc_allocateClassPair([NSObject class], "Student", 0);
        class_addIvar(cls, "age", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        objc_registerClassPair(cls);
        id student = [[cls alloc] init];
        [student setValue:@"20" forKey:@"age"];
        NSLog(@"%@",[student valueForKey:@"age"]);
        /**
         总结: 类编译时只读结构体class_ro_t就会被确定, 运行时不可修改
         ro结构体中的ivar_list_t也是不可修改的, 并且instanceSize决定了创建对象时需要的空间大小
         在objc_allocateClassPair和objc_registerClassPair之间调用class_addIvar动态添加成员变量
         */
        

    }
    return 0;
}
