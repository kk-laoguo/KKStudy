//
//  UIView+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIView+SensorsData.h"



@implementation UIView (SensorsData)
- (NSString *)sensorsdata_elementType {
    return NSStringFromClass([self class]);
}
- (NSString *)sensorsdata_elementContent {
    if (self.isHidden || self.alpha == 0) {
        return nil;
    }
    NSMutableArray *contents = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        NSString *content = view.sensorsdata_elementContent;
        if (content.length > 0) {
            [contents addObject:content];
        }
    }
    return contents.count == 0 ? nil:[contents componentsJoinedByString:@"-"];
}
- (UIViewController *)sensorsdata_viewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}
@end
