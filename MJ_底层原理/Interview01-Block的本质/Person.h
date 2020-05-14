//
//  Person.h
//  Interview01-Block的本质
//
//  Created by zainguo on 2020/4/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^YXBlock)(void);
@interface Person : NSObject
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) YXBlock block;


@end

NS_ASSUME_NONNULL_END
