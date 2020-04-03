//
//  CDDContext.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "CDDContext.h"

#import "NSObject+CDD.h"


@implementation CDDPresenter
@end

@implementation CDDInteractor
@end

@implementation CDDView
- (void)dealloc {
    self.context = nil;
}
@end

@implementation CDDContext

- (void)dealloc {
    NSLog(@"context being released");
}

@end
