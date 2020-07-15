//
//  main.m
//  LoadTest
//
//  Created by zainguo on 2020/1/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger num1 = 1;
        NSInteger num2 = 1;
        NSNumber *num3 = @3;
        NSNumber *numFFF = @(0xFFFF);
        NSLog(@"number1 pointer is %p", num1);
        NSLog(@"number2 pointer is %p", num2);
        NSLog(@"number3 pointer is %p", num3);
        NSLog(@"numFFF pointer is %p", numFFF);

    }
    return 0;
}
