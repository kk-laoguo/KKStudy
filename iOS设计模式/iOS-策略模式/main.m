//
//  main.m
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//  https://ityongzhen.github.io/iOS设计模式之(一)策略模式.html


#import <Foundation/Foundation.h>

#import "Adult.h"
#import "Child.h"
#import "OldMan.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        Child *child = [Child new];
        [child eatSomeThing];
        [child runEveryDay];
        
        Adult *adult = [Adult new];
        [adult eatSomeThing];
        [adult runEveryDay];
        
        OldMan *oldMan = [OldMan new];
        [oldMan eatSomeThing];
        [oldMan runEveryDay];
    }
    return 0;
}
