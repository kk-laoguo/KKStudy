//
//  NextViewController.m
//  Test
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)buttonClick:(UIButton *)btn {
    NSLog(@"------------>");
}


@end
