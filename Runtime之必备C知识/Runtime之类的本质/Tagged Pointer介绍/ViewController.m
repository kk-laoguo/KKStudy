//
//  ViewController.m
//  Tagged Pointer介绍
//
//  Created by zainguo on 2019/6/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ViewController.h"
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *num1 = @10;
    NSNumber *num2 = @11;
    NSNumber *num3 = @777;
    NSLog(@"number1：%p",num1);
    NSLog(@"number2：%p",num2);
    NSLog(@"number3：%p",num3);
    

    
}


@end
