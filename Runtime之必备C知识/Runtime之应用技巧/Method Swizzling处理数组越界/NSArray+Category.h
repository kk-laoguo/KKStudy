//
//  NSArray+Category.h
//  Method Swizzling处理数组越界
//
//  Created by zainguo on 2019/7/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Category)

- (id)cf_objectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
