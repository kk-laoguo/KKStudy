//
//  CQViewController.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQViewController.h"
#import "CQDeallocTestViewController.h"
@interface CQViewController ()

@end

@implementation CQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"摇晃手机试试";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40];
    label.textColor = [UIColor blackColor];
    label.center = self.view.center;
    label.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 100);
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"点击测试VC释放" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    button.center = CGPointMake(self.view.center.x, 120);
    button.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    [button addTarget:self action:@selector(pushDeallocVC)  forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

- (void)pushDeallocVC {
    CQDeallocTestViewController *vc = [[CQDeallocTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
