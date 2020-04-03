//
//  ViewController.m
//  ZYLibDemo
//
//  Created by zainguo on 2020/3/25.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"
#import "ZYBusinessTool.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZYBusinessTool getHomeData];
}


@end
