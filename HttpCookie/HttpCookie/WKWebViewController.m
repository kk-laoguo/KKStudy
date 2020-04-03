//
//  WKWebViewController.m
//  HttpCookie
//
//  Created by zainguo on 2020/2/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // https://xiaozhuanlan.com/topic/2517460839
    
    WKWebViewConfiguration *configure = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configure];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    [self.webView loadRequest:request];
    // 添加cookie, 单次请求有效, 一旦URL改变, cookie还会丢失
    [self.webView loadRequest:[self cookieAppendRequest]];

}
#pragma mark - Target Methods

- (IBAction)setCookies:(id)sender {
    
  
}
- (IBAction)getCookies:(id)sender {
    NSHTTPCookieStorage *storages = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [storages.cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"---------cookie == %@", obj);
    }];
}
// 拉取更新cookie
- (NSURLRequest *)cookieAppendRequest{
    
    // 网络里面数据保存地方
    // 拉去更新cookie
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    //Cookies数组转换为requestHeaderFields
    NSDictionary *requestHeaderFields = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    //设置请求头
    request.allHTTPHeaderFields = requestHeaderFields;
    NSLog(@"%@",request.allHTTPHeaderFields);
    return request;
}
- (NSURLRequest *)fixNewRequestCookieWithRequest:(NSURLRequest *)originalRequest{
    NSMutableURLRequest *fixedRequest;
    if ([originalRequest isKindOfClass:[NSMutableURLRequest class]]) {
        fixedRequest = (NSMutableURLRequest *)originalRequest;
    } else {
        fixedRequest = originalRequest.mutableCopy;
    }
    //防止Cookie丢失
    NSDictionary *dict = [NSHTTPCookie requestHeaderFieldsWithCookies:[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies];
    if (dict.count) {
        NSMutableDictionary *mDict = originalRequest.allHTTPHeaderFields.mutableCopy;
        [mDict setValuesForKeysWithDictionary:dict];
        fixedRequest.allHTTPHeaderFields = mDict;
    }
    return fixedRequest;
}
#pragma mark -  WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //开始加载的时候，让加载进度条显示
    NSLog(@"开始加载的时候调用。。");
    NSLog(@"%lf", self.webView.estimatedProgress);
}
// 方式一:
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    // 跨域请求丢失
//    // 在代理中拉取更新
//    [self fixNewRequestCookieWithRequest:navigationAction.request];
//    decisionHandler(WKNavigationActionPolicyAllow);
//}

// 方式二:
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    if (@available(iOS 11.0, *)) {//iOS11也有这种获取方式，但是我使用的时候iOS11系统可以在response里面直接获取到，只有iOS12获取不到
        WKHTTPCookieStore *cookieStore = webView.configuration.websiteDataStore.httpCookieStore;
        [cookieStore getAllCookies:^(NSArray* cookies) {
            [self setCookie:cookies];
        }];
    }else {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)navigationResponse.response;
        NSArray *cookies =[NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:response.URL];
        [self setCookie:cookies];
    }
    decisionHandler(WKNavigationResponsePolicyAllow);
}
 
- (void)setCookie:(NSArray *)cookies {
    if (cookies.count > 0) {
        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }

}
@end
