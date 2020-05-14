//
//  LGProxy.h
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGProxy : NSProxy
+ (instancetype)proxyWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
