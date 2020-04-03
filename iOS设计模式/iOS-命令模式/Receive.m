//
//  Receive.m
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Receive.h"

#define centerX [UIScreen mainScreen].bounds.size.width/2
#define centerY [UIScreen mainScreen].bounds.size.height/2

@implementation Receive

- (void)amplifyView:(CGFloat)parameter {
    
    _width += parameter;
    _width = MIN(_width, [UIScreen mainScreen].bounds.size.width);
    _redView.frame = CGRectMake(centerX - _width/2,centerY - _width/2, _width, _width);

}

- (void)reduceView:(CGFloat)parameter {
    _width -= parameter;
    _width = MAX(_width, 100);
    _redView.frame = CGRectMake(centerX - _width/2,centerY - _width/2, _width, _width);

}
@end
