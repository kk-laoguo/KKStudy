//
//  Person.h
//  Initiallize
//
//  Created by zainguo on 2019/11/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSString *_name;
}
@property (nonatomic, copy) NSString *personName;

+ (void)load;
+ (void)test;

@end

NS_ASSUME_NONNULL_END
