//
//  ViewController.m
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"
#import "KCWrapManager.h"
#import "KCHomeView.h"

@interface ViewController ()

@property (nonatomic, strong) KCWrapManager *manager;
@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"%@--------%s", self.class, __func__);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
  
    self.manager = [KCWrapManager configWignController:self];

//    KCHomeView *home = [[KCHomeView alloc] initWithController:manager.vc];
//    [self.view addSubview:home];
    
    
}


@end
