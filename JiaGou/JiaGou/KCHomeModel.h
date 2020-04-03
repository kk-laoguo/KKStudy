//
//  KCHomeModel.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCHomeModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * title;

- (void)logName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
