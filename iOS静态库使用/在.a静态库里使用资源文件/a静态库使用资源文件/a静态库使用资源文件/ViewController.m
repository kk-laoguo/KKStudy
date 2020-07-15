//
//  ViewController.m
//  a静态库使用资源文件
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"
#import "KKStaticLib.h"
#import "KKBundleManager.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [KKBundleManager filePathFromBundle:@"lufei.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
}
- (IBAction)next:(id)sender {
    
    NSBundle *bundle = [KKBundleManager bundle];
    NextViewController *vc = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:bundle];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
