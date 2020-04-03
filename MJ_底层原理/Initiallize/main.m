//
//  main.m
//  Initiallize
//
//  Created by zainguo on 2019/11/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test1.h"
#import "Person+Test2.h"
#import "Student.h"
#import "Student+Test1.h"
#import "Student+Test2.h"

#import "NSObject+Runtime.h"

#import <objc/runtime.h>
#import <objc/message.h>

void printMethodNamesOfClass(Class cls) {
    unsigned int count;
    // 获取方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    // 释放
    free(methodList);
    // 打印方法名
    NSLog(@"%@ ---- %@", cls, methodNames);
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        [Student alloc];
        NSLog(@"-------------");
        [Person load];
        [Person test];
        NSLog(@"-------------");
        const char *name = [@"Person" UTF8String];
        printMethodNamesOfClass(objc_getClass(name));
        NSArray *methods = [object_getClass([Person class]) yx_getAllMethods];
        NSLog(@"-------------方法列表:%@", methods);
        
        NSLog(@"-------------属性列表:%@", [Person yx_getAllProperties]);
        NSLog(@"-------------成员列表:%@", [Person yx_getAllIvarList]);

        
        

    }
    return 0;
}
