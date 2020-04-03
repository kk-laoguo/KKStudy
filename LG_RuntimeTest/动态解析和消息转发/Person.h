//
//  Person.h
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)eat;
+ (void)eat;

+ (void)run;

- (void)walk;

+ (void)superRun;

+ (void)instanceFunc;

@end

NS_ASSUME_NONNULL_END
