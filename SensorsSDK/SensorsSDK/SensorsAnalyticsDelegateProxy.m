//
//  SensorsAnalyticsDelegateProxy.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "SensorsAnalyticsDelegateProxy.h"

#import "SensorsAnalyticsSDK.h"

@interface SensorsAnalyticsDelegateProxy()
@property (nonatomic, weak) id delegate;

@end

@implementation SensorsAnalyticsDelegateProxy

+ (instancetype)proxyWithTableViewDelegate:(id<UITableViewDelegate>)delegate {
    SensorsAnalyticsDelegateProxy *proxy = [SensorsAnalyticsDelegateProxy alloc];
    proxy.delegate = delegate;
    return proxy;
}
// 返回方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    // 返回delegate对象中的方法签名
    return [self.delegate methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation {
    // 先执行delegate对象中的方法
    if (invocation.selector == @selector(tableView:didSelectRowAtIndexPath:)) {
        // 将方法修改为数据采集的方法
        invocation.selector = @selector(yx_tableView:didSelectRowAtIndexPath:);
        [invocation invokeWithTarget:self];
         
    } else {
        [invocation invokeWithTarget:self.delegate];
    }
}
- (void)yx_tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    // 埋点SDK
    [[SensorsAnalyticsSDK shareInstance] trackAppClickWithTableView:tableView
                                            didSelectRowAtIndexPath:indexPath
                                                         properties:nil];
}
@end
