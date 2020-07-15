//
//  UITableView+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UITableView+SensorsData.h"
#import "SensorsAnalyticsDelegateProxy.h"

#import "NSObject+Swizzler.h"
#import "SensorsAnalyticsSDK.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIScrollView+SensorsData.h"
#import "UIView+SensorsData.h"

@implementation UITableView (SensorsData)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yx_swizzleInstanceMethod(self, @selector(setDelegate:), @selector(yx_setDelegate:));
    });
}
- (void)yx_setDelegate:(id<UITableViewDelegate>)delegate {
    // NSProxy消息转发
    self.sensorsdata_delegateProxy = nil;
    SensorsAnalyticsDelegateProxy *proxy = [SensorsAnalyticsDelegateProxy proxyWithTableViewDelegate:delegate];
    self.sensorsdata_delegateProxy = proxy;
    // 调用原始方法, 将代理设置为委托对象
    [self yx_setDelegate:proxy];
}

void yx_tableViewDidSelectRow(id objc, SEL selector, UITableView *tableView, NSIndexPath *indexPath) {
    SEL destinationSelector = NSSelectorFromString(@"");
    ((void(*)(id, SEL, id, id)) objc_msgSend)(objc, destinationSelector, tableView, indexPath);
}

@end
