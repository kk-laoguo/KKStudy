//
//  UILabel+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UILabel+SensorsData.h"
#import "UIView+SensorsData.h"

@implementation UILabel (SensorsData)
- (NSString *)sensorsdata_elementContent {
  
    return self.text ? :super.sensorsdata_elementContent;
    
}
@end
