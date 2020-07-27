//
//  NSObject+CFCoding.h
//  自动归档和自动解档
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CFCoding)
// 归档
- (void)cf_encode:(NSCoder *)coder;
// 解档
- (void)cf_decode:(NSCoder *)decoder;

@end

NS_ASSUME_NONNULL_END
