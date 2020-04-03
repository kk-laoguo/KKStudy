//
//  CQDevContext.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQUrlContext.h"

NSString *const DevUrlKey = @"DevUrlKey";
NSString *const DevTitleKey = @"DevTitleKey";
@implementation CQUrlContext

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.url forKey:DevUrlKey];
    [aCoder encodeObject:self.devTitle forKey:DevTitleKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _url = [aDecoder decodeObjectForKey:DevUrlKey];
        _devTitle = [aDecoder decodeObjectForKey:DevTitleKey];
    }
    return self;
}

@end
