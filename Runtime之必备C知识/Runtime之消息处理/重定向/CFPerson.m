//
//  CFPerson.m
//  重定向
//
//  Created by zainguo on 2019/7/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFPerson.h"
#import "CFStudent.h"

@implementation CFPerson

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == NSSelectorFromString(@"studying")) {
        return [CFStudent new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
