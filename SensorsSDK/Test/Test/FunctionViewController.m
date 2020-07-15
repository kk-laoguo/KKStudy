//
//  FunctionViewController.m
//  Test
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "FunctionViewController.h"

@interface FunctionViewController ()

@end

@implementation FunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    [self.navigationController pushViewController:[NSClassFromString(@"TableViewController") new] animated:YES];
}


@end
