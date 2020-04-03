//
//  Animal.h
//  iOS-单例模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
