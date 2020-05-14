//
//  main.m
//  Interview01-Block的本质
//
//  Created by zainguo on 2020/4/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int age = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSInteger a = 10;
//        NSInteger b = 20;
//        a = a + b;
//        b = a - b;
//        a = a - b;
//        __block int age = 10;
        
        Person *p = [[Person alloc] init];
        p.name = @"ss";
//        __weak Person *weakPerson = p;
        __weak typeof(p) weakPerson = p;
        p.block = ^{
            NSLog(@"------%@", weakPerson.name);
        };
        
        
        void(^block1)(void) = ^ {
            NSLog(@"------%d", age);
        };
        block1();
        NSLog(@"------%@", [block1 class]);

    }
    return 0;
}
