//
//  main.m
//  objc_msgSend介绍
//
//  Created by zainguo on 2019/6/27.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CFStudent.h"

#import <objc/runtime.h>
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    /*
     *1.正常调用方法
     */
    CFPerson *person  =  [CFPerson new];
    [CFPerson sleeping];
    
    CFStudent *student  = [CFStudent new];
    [person eatingWithFood:@"apple" inPlace:@"kitchen"];
    [person playing];
    
    /*
     *2.使用objc_msgSend
     */
    objc_msgSend(person, @selector(playing));
    objc_msgSend(person, @selector(eatingWithFood:inPlace:), @"apple",@"kitchen");
    objc_msgSend([CFPerson class], @selector(sleeping));
    /*
     objc_msgSend_stret：消息返回的是结构体
     objc_msgSend_fpret：消息返回的是浮点数
     objc_msgSendSuper：给父类发消息
     */
    
    struct objc_super objSuper;
    objSuper.receiver = student;
    objSuper.super_class = CFPerson.class;
    objc_msgSendSuper(&objSuper, @selector(playing));
    
    
    
    return 0;
}
