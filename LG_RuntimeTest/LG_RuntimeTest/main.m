//
//  main.m
//  LG_RuntimeTest
//
//  Created by zainguo on 2020/3/27.
//  Copyright © 2020 zainguo. All rights reserved.
//
#import "Student.h"
#import "Student.h"
#include <objc/message.h>

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 对象的本质就是结构体
        Person *p = [[Person alloc] init];
        [p run];
        // 方法的本质: 消息 : 消息接受者 消息编号 ....参数 (消息体)
        objc_msgSend(p, sel_registerName("run"));
        NSLog(@"%p -- %p",("run"),@selector(run));
        // 发送类方法
        objc_msgSend(objc_getClass("Person"), sel_registerName("walk"));

        // 向父类发送消息
        Student *s = [Student new];
        struct objc_super sup;
        sup.receiver = s;
        sup.super_class = class_getSuperclass([s class]);
        objc_msgSendSuper(&sup, @selector(run));
        
        // 向父类发送类方法
        sup.super_class = class_getSuperclass(object_getClass([s class])); // 元类
        objc_msgSendSuper(&sup, @selector(walk));
        
        // 对象方法存在哪
        // 类方法存在哪
        
        // 类方法 存在 元类 ---  是以 实例方法来存储的
        // 对象 在 类 里面 是一个  实例
        // 类 在元类  里面 是一个  实例

    }
    return 0;
}
