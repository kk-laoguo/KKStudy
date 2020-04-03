//
//  CQDeallocTestViewController.m
//  CQDebugTool_Example
//
//  Created by QingGe on 2019/4/16.
//  Copyright © 2019 luchunqing. All rights reserved.
//

#import "CQDeallocTestViewController.h"

@interface CQDeallocTestViewController ()

@end

@implementation CQDeallocTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"返回试试";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40];
    label.textColor = [UIColor blackColor];
    label.center = self.view.center;
    label.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 100);
    [self.view addSubview:label];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
