//
//  UIViewController+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIViewController+SensorsData.h"
#import "NSObject+Swizzler.h"
#import "SensorsAnalyticsSDK.h"

static NSString *const kSensorsDataBlackListFileName = @"sensorsdata_black_list";

@implementation UIViewController (SensorsData)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yx_swizzleInstanceMethod([self class], @selector(viewDidAppear:), @selector(yx_viewDidAppear:));
    });
}
- (void)yx_viewDidAppear:(BOOL)animated {
    // 调用原来的viewDidAppear:
    [self yx_viewDidAppear:animated];
    if (![self shouldTrakAppViewScreen]) {
        return;
    }
    // 设置$AppViewScreen事件
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setValue:NSStringFromClass([self class]) forKey:@"$viewController_name"];
    [properties setValue:self.navigationItem.title forKey:@"$title"];
    [[SensorsAnalyticsSDK shareInstance] track:@"$AppViewScreen" properties:properties];
}
- (BOOL)shouldTrakAppViewScreen {
    
    static NSSet *blackList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取黑名单文件路径
        NSString *path = [[NSBundle bundleForClass:SensorsAnalyticsSDK.class] pathForResource:kSensorsDataBlackListFileName ofType:@"plist"];
        // 读取文件中黑名单
        NSArray *classNames = [NSArray arrayWithContentsOfFile:path];
        NSMutableSet *set = [NSMutableSet setWithCapacity:classNames.count];
        for (NSString *className in classNames) {
            [set addObject:NSClassFromString(className)];
            blackList = [set copy];
        }
    });
    for (Class cla in blackList) {
        if ([self isKindOfClass:cla]) {
            return NO;
        }
    }
    return YES;
}



@end
