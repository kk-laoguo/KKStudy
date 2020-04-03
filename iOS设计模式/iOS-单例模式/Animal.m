//
//  Animal.m
//  iOS-单例模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Animal.h"



@implementation Animal

+ (instancetype)sharedInstance {
    
    static id _instance = nil;
    static dispatch_once_t onceToken;
    NSLog(@"before dispatch_once onceToken = %ld",onceToken);

    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        NSLog(@"before dispatch_once onceToken = %ld",onceToken);
        
    });
    NSLog(@"before dispatch_once onceToken = %ld",onceToken);

    return _instance;
}

@end
