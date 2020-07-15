//
//  UIButton+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIButton+SensorsData.h"

#import "SensorsAnalyticsSDK.h"

@implementation UIButton (SensorsData)

- (NSString *)sensorsdata_elementContent {
    return self.titleLabel.text;
}
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
    [[SensorsAnalyticsSDK shareInstance] trackAppClickWithView:self properties:nil];
}


@end
