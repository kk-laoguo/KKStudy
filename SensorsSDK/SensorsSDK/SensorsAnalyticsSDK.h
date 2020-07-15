//
//  SensorsAnalyticsSDK.h
//  SensorsSDK
//
//  Created by zainguo on 2020/6/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface SensorsAnalyticsSDK : NSObject

@property (nonatomic, strong) NSDictionary <NSString *, id> *automaticProperties;

+ (SensorsAnalyticsSDK *)shareInstance;

- (void)track:(NSString *)eventName
   properties:(NSDictionary <NSString *, id> *)properties;

@end

@interface SensorsAnalyticsSDK (Track)
// 判断是否是后台被动唤醒(被动启动)
@property (nonatomic, assign) BOOL launchedPassively;

- (void)eventName:(NSString *)eventName
       properties:(NSDictionary<NSString *, id> *)properties;

- (void)trackAppClickWithView:(UIView *)view
                   properties:(NSDictionary <NSString *, id> *)properties;

- (void)trackAppClickWithTableView:(UITableView *)tableView
           didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                        properties:(NSDictionary<NSString *, id> *)properties;

@end
