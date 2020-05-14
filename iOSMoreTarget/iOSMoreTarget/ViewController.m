//
//  ViewController.m
//  iOSMoreTarget
//
//  Created by zainguo on 2020/5/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readValueFromConfigurationFile];
}

- (void) readValueFromConfigurationFile {
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"scheme"];
    NSLog(@"appVersion:%@", appVersion);
}

@end
