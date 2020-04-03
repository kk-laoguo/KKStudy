//
//  NextViewController.m
//  MemeoryLeakTool
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NextViewController.h"

typedef void (^LGBlock)(void);

@interface NextViewController ()
@property (nonatomic, copy)   LGBlock block;
@property (nonatomic, strong) NSString *name;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.block = ^{
        self.name = @"22";
    };
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
