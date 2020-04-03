//
//  WebViewController.m
//  HttpCookie
//
//  Created by zainguo on 2020/2/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
}
- (IBAction)getCookies:(id)sender {
    NSHTTPCookieStorage *storages = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [storages.cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"---------cookie == %@", obj);
    }];
}

- (IBAction)setCookies:(id)sender {
    
    [self setCookieWithDomain:@"http://www.baidu.com" sessionName:@"aaa_token_UIWebView" sessionValue:@"123456789" expiresDate:nil];
    
    NSDictionary *headerDic = [NSHTTPCookie requestHeaderFieldsWithCookies:[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    request.allHTTPHeaderFields = headerDic;
    [self.webView loadRequest:request];

}


@end
