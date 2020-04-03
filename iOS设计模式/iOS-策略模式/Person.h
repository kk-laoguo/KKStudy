//
//  Person.h
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Run.h"
#import "Eat.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) id<Run>run;
@property (nonatomic, strong) id<Eat>eat;
- (void)eatSomeThing;
- (void)runEveryDay;

@end

NS_ASSUME_NONNULL_END
