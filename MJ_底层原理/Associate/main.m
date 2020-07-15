//
//  main.m
//  Associate
//
//  Created by zainguo on 2019/11/19.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

#import "Person+Test1.h"

#import <objc/runtime.h>

@protocol CustomProtocol <NSObject>

@required
- (void)test;

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        p1.age = 18;
        p1.weight = 60;
        p1.name = @"张三";
        
        Person *p2 = [[Person alloc] init];
        p2.age = 20;
        p2.weight = 65;
        p2.name = @"李四";
        
//        NSLog(@"--->%zd", class_getInstanceSize([NSObject class]));
        
//        [p2 eat];
        
        NSLog(@"p1 的 age: %d name: %@ weight: %d", p1.age, p1.name, p1.weight);
        NSLog(@"p2 的 age: %d name: %@ weight: %d", p2.age, p2.name, p2.weight);

    }
    return 0;
}
