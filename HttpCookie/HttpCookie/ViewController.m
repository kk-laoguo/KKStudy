//
//  ViewController.m
//  HttpCookie
//
//  Created by zainguo on 2020/2/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)setCookieWithDomain:(NSString*)domainValue
                sessionName:(NSString *)name
               sessionValue:(NSString *)value
                expiresDate:(NSDate *)date {
    
    NSURL *url = [NSURL URLWithString:domainValue];
    NSString *domain = url.host;
    
    // 创建字典存储cookie的属性值
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    // 设置cookie名
    [cookieProperties setObject:name forKey:NSHTTPCookieName];
    // 设置cookie值
    [cookieProperties setObject:value forKey:NSHTTPCookieValue];
    // 设置cookie域名
    [cookieProperties setObject:domain forKey:NSHTTPCookieDomain];
    // 设置cookie路径 一般写 "/"
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    // 设置cookie版本
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    // 设置cookie过期时间
    if (date) {
        [cookieProperties setObject:date forKey:NSHTTPCookieExpires];
    } else {
        [cookieProperties setObject:[NSDate dateWithTimeIntervalSince1970:([[NSDate date] timeIntervalSince1970]) + 365 * 24 * 3600] forKey:NSHTTPCookieExpires];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:cookieProperties forKey:@"app_cookies"];
    
    // 删除原cookie, 如果存在的话
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
    }];
    // 使用字典初始化新的cookie
    NSHTTPCookie *newCookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    // 使用cookie管理器 存储cookie
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];

}

@end
