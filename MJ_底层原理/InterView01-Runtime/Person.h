//
//  Person.h
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)setTail:(BOOL)tail;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;

- (BOOL)isTail;
- (BOOL)isRich;
- (BOOL)isHandsome;

- (void)test;


@end

NS_ASSUME_NONNULL_END
