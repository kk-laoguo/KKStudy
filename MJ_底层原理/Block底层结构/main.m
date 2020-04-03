//
//  main.m
//  Block底层结构
//
//  Created by zainguo on 2019/11/20.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

int c = 99;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void(^block)(void) = ^{
            NSLog(@"this is block2");
        };
        block();
        
        static int age = 10;
        void(^numBlock)(int, int) = ^(int a, int b) {
            NSLog(@"this is a block - %d -%d -%d -%d", a, b, age, c);
    
        };
        age = 88;
        c = 199;
        
        numBlock(10, 20);
    


        
    }
    return 0;
}
