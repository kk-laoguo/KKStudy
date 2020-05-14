//
//  KCWrapManager.h
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCWrapManager : NSObject

@property (nonatomic, weak) UIViewController *vc;

+ (KCWrapManager *)configWignController:(UIViewController *)controller;


@end

