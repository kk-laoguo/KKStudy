//
//  ViewController.m
//  CXResidentThread
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"
#import "CXPermenantThread.h"
#import "CXProxy.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (nonatomic, strong) CXPermenantThread *thread;

@property (nonatomic, strong) NSTimer       *timer;
@property (nonatomic, strong) CXProxy       *proxy;
@property (nonatomic, strong) WKWebView *webView;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[CXPermenantThread alloc] init];
    
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.backgroundColor = [UIColor redColor];
    
    NSString *url = @"https://www.jianshu.com/p/9dc918460da7";
    
    NSString *encodedString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:encodedString]]];
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];

    
    
    [self.view addSubview:self.webView];
    
    
//    self.proxy = [CXProxy proxyWithObject:self];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.proxy selector:@selector(fireHome) userInfo:nil repeats:YES];
}
- (IBAction)stop:(id)sender {
    
    [self.thread stop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self.thread executeTask:^{
//        NSLog(@"执行任务 - %@", [NSThread currentThread]);
//    }];
    
//    [self.thread executeTaskWithTarget:self selector:@selector(fireHome)];
    
}


- (void)fireHome {
    NSLog(@"%s",__func__);
}
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"%s", __func__);
}

@end
