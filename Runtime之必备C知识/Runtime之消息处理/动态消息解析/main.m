//
//  main.m
//  动态消息解析
//
//  Created by zainguo on 2019/7/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"

int main(int argc, const char * argv[]) {
    // 类方法
    [CFPerson performSelector:NSSelectorFromString(@"playing")];
    [CFPerson performSelector:NSSelectorFromString(@"sleeping")];
    
    //2.实例方法
    CFPerson *person = [[CFPerson alloc]init];
    [person performSelector:NSSelectorFromString(@"eating")];
    [person performSelector:NSSelectorFromString(@"sleeping")];     //可以执行成功
    
    
    /*
     *3.@dynamic
     */
    person.name = @"lilei";
    NSLog(@"person.name：%@",person.name);
    
    return 0;
}
