//
//  kCBaseNavigationController.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "kCBaseNavigationController.h"

@interface kCBaseNavigationController ()

@end

@implementation kCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController* ctrl = [super popViewControllerAnimated:animated];
    
    return ctrl;
}



@end
