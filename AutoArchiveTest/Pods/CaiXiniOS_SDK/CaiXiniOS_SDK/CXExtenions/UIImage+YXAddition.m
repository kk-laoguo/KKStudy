//
//  UIImage+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/16.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIImage+YXAddition.h"

@implementation UIImage (YXAddition)


+ (UIImage *)yx_createImageWithColor:(UIColor *)color {
    return [self yx_createImageWithColor:color bounds:CGRectZero];
}

+ (UIImage *)yx_createImageWithColor:(UIColor *)color
                              bounds:(CGRect)bounds {
    
    
    CGRect rect = CGRectMake(0, 0, 1.0, 1.0);
    if (bounds.size.width) {
        rect = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;

}



@end
