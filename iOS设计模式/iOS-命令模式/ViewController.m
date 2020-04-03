//
//  ViewController.m
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//  https://ityongzhen.github.io/iOS设计模式之(六)命令模式.html

#import "ViewController.h"
#import "Invoker.h"
#import "Receive.h"
#import "AmplifyCommand.h"
#import "ReduceCommand.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (nonatomic, strong) Receive *receiver;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.receiver = [[Receive alloc] init];
    self.receiver.redView = self.redView;
    self.receiver.width = 100;
    
}

- (IBAction)amplifyAction:(id)sender {
    
    AmplifyCommand *command = [[AmplifyCommand alloc] initWithReceive:self.receiver value:20];
    [[Invoker sharedInstance] excute:command];
    
}
- (IBAction)rollBack:(id)sender {
    [[Invoker sharedInstance] rollBack];
}
- (IBAction)reduceAction:(id)sender {
    
    ReduceCommand *command = [[ReduceCommand alloc] initWithReceive:self.receiver value:20];
    [[Invoker sharedInstance] excute:command];
    
}


@end
