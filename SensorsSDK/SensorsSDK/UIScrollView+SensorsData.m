//
//  UIScrollView+SensorsData.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIScrollView+SensorsData.h"
#import <objc/runtime.h>

@implementation UIScrollView (SensorsData)

- (void)setSensorsdata_delegateProxy:(SensorsAnalyticsDelegateProxy *)sensorsdata_delegateProxy {
    
    objc_setAssociatedObject(self, @selector(sensorsdata_delegateProxy), sensorsdata_delegateProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SensorsAnalyticsDelegateProxy *)sensorsdata_delegateProxy {
    return objc_getAssociatedObject(self, _cmd);
}
@end
