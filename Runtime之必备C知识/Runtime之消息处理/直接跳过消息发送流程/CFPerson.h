//
//  CFPerson.h
//  直接跳过消息发送流程
//
//  Created by zainguo on 2019/6/28.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFPerson : NSObject
//吃东西
- (void)eatingWithFood:(NSString*)foodName inPlace:(NSString*)placeName;
@end

NS_ASSUME_NONNULL_END
