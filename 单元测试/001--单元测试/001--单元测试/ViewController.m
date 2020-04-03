//
//  ViewController.m
//  001--单元测试
//
//  Created by zainguo on 2019/12/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}
- (int)getPlus:(int)num1 num2:(int)num2 {
    return num1 + num2;
}
- (void)loadData:(void (^)(id))dataBlock {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2];
        NSString *dataStr = @"meilo";
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"刷新UI");
            dataBlock(dataStr);
        });
    });
}

- (void)openCamera {
    for (NSInteger i = 0; i < 1000; i ++) {
        NSLog(@"----->%zd", i);
    }
}

@end
