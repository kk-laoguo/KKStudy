//
//  CXProxy.h
//  CXResidentThread
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXProxy : NSProxy
+ (instancetype)proxyWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
