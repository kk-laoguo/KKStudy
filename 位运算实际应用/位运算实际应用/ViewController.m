//
//  ViewController.m
//  位运算实际应用
//
//  Created by zainguo on 2020/4/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

//typedef NS_ENUM(NSUInteger, YXOptions) {
//    YXOptionsOne = 1,       // 0b0001
//    YXOptionsTwo = 2,       // 0b0010
//    YXOptionsThree = 4,     // 0b0100
//    YXOptionsFour = 8       // 0b1000
//};

typedef NS_ENUM(NSUInteger, YXOptions) {
    // 左移
//    YXOptionsNone = 0,         // 0b0000
    YXOptionsOne = 1<<0,       // 0b0001
    YXOptionsTwo = 1<<1,       // 0b0010
    YXOptionsThree = 1<<2,     // 0b0100
    YXOptionsFour = 1<<3       // 0b1000
};


@interface ViewController ()

@end

@implementation ViewController

/*
 0b0001
 0b0010
 0b1000
 | 或运算 == +运算
 ------
 0b1011
&0b0001
 ------
 求出具体值
 0b0001
 */

- (void)setOptions:(YXOptions)optons {
    if (optons & YXOptionsOne) {
        NSLog(@"包含了YXOptionsOne");
    }
    if (optons & YXOptionsTwo) {
        NSLog(@"包含了YXOptionsTwo");
    }
    if (optons & YXOptionsThree) {
        NSLog(@"包含了YXOptionsThree");
    }
    if (optons & YXOptionsFour) {
        NSLog(@"包含了YXOptionsFour");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    
    [self setOptions:YXOptionsOne | YXOptionsTwo];
    [self setOptions:YXOptionsOne + YXOptionsTwo];

    
}


@end
