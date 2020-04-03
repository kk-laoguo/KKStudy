//
//  KCBasePresenter.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//


#import "KCBasePresenter.h"

#define Notif               [NSNotificationCenter defaultCenter]


@interface KCBasePresenter ()
@property (nonatomic, strong) NSMutableDictionary   *eventMap;

@end

@implementation KCBasePresenter

- (void)dealloc {
    [Notif removeObserver:self];
}

- (void)observeTable:(NSString *)table
               event:(NSString *)event
            selector:(SEL)sel {
    
    if (self.eventMap == nil) {
        self.eventMap = [NSMutableDictionary dictionary];
    }
    NSString *eventKey = [NSString stringWithFormat:@"%@_%@", table, event];
    [_eventMap setObject:NSStringFromSelector(sel) forKey:eventKey];
    [Notif removeObserver:self name:table object:nil];
    [Notif addObserver:self selector:@selector(detectDBChange:) name:table object:nil];
}
- (void)unobserveTable:(NSString *)table event:(NSString *)event {
    
    NSString *eventKey = [NSString stringWithFormat:@"%@_%@", table, event];
    [_eventMap removeObjectForKey:eventKey];
}
- (void)postLoading {};
- (void)hideLoading {};

- (void)postImageToast:(NSString *)toast {};
- (void)postToast:(NSString *)toast {};
#pragma mark - 通知SEL
- (void)detectDBChange:(NSNotification*)notif {
    
    NSDictionary *info = notif.userInfo;
    NSString *table = info[@"table"];
    NSString *event = info[@"event"];
    id data = info[@"data"];
    
    NSString *eventKey = [NSString stringWithFormat:@"%@_%@", table, event];
    NSString *selectorName = [_eventMap objectForKey:eventKey];
    if (selectorName.length > 0) {
        // 执行方法
        [self performSelectorOnMainThread:NSSelectorFromString(selectorName) withObject:data waitUntilDone:false];
    }
}

@end
