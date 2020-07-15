//
//  UIScrollView+SensorsData.h
//  SensorsSDK
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <UIKit/UIKit.h>

@class SensorsAnalyticsDelegateProxy;

@interface UIScrollView (SensorsData)

@property (nonatomic, strong) SensorsAnalyticsDelegateProxy *sensorsdata_delegateProxy;

@end

