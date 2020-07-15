//
//  KKBundleManager.m
//  XibTestSDK
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KKBundleManager.h"

@implementation KKBundleManager

+ (NSBundle *)bundle {
    return [NSBundle bundleWithPath: [[NSBundle mainBundle] pathForResource:@"KKLibBundle" ofType: @"bundle"]];
}
+ (NSString *)filePathFromBundle:(NSString *)filePath {
    NSBundle *bundle = [KKBundleManager bundle];
    if (bundle && filePath) {
        return [[bundle resourcePath] stringByAppendingPathComponent: filePath];
    }
    return nil;
}

@end
