//
//  ViewController.m
//  使用Framework里面的XIB文件
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"
#import "KKStaticLib.h"
#import <XibTestSDK/XibTestSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"XibTestSDK" ofType:@"framework"];
//    NSBundle *bundle = [NSBundle bundleWithPath:path];
//    UIImage *image = [UIImage imageNamed:@"XibBundle.bundle/lufei" inBundle:bundle compatibleWithTraitCollection:nil];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    
    UIImage *image = [UIImage imageWithContentsOfFile:[KKBundleManager filePathFromBundle:@"lufei.png"]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    [KKStaticLib classMethod];
    
}
- (IBAction)gotoNext:(id)sender {
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"XibTestSDK" ofType:@"framework"];
//    NSBundle *bundle = [NSBundle bundleWithPath:path];
//    XIBTestViewController *vc = [[XIBTestViewController alloc] initWithNibName:@"XIBTestViewController" bundle:bundle];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    XIBTestViewController *vc = [[XIBTestViewController alloc] initWithNibName:@"XIBTestViewController" bundle:[KKBundleManager bundle]];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}


@end
