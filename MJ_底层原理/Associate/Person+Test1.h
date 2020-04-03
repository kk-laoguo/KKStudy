//
//  Person+Test1.h
//  Associate
//
//  Created by zainguo on 2019/11/19.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <AppKit/AppKit.h>


#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Test1)
@property (nonatomic, assign) int weight;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
