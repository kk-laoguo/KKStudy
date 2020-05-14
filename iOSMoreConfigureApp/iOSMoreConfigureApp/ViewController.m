//
//  ViewController.m
//  iOSMoreConfigureApp
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
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100)];
    lab.text = [self readValueFromConfigurationFile];
    [self.view addSubview:lab];
}

- (NSString *) readValueFromConfigurationFile {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Configuration" ofType:@"plist"];
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:path];
    return config[@"serverURL"];
}

@end
