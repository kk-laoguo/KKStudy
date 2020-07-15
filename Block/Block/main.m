//
//  main.m
//  Block
//
//  Created by zainguo on 2020/6/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
int height = 18;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int age = 10;
        static int name = 0;
        __block int sum = 10;
        void (^block)(void) = ^{
            name = 100;
            height = 99;
            sum = 20;
            NSLog(@"------>%d", age);
        };
        block();
    }
    return 0;
}
