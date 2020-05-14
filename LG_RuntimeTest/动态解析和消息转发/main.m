//
//  main.m
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/28.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

#include <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

//
//        [Person run];
//
//        [p walk];
//
//        [Student superRun];
        
        // 动态解析
        
        Person *p = [[Person alloc] init];
//        [p eat];
        [Person eat];
        
        [Person instanceFunc];
        
        
        Student *s = [[Student alloc] init];
     
        
    }
    return 0;
}



