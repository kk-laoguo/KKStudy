//
//  Receive.h
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Receive : NSObject

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIView *redView;

- (void)amplifyView:(CGFloat)parameter;
- (void)reduceView:(CGFloat)parameter;

@end

