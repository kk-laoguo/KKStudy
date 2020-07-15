//
//  KKBundleManager.h
//  XibTestSDK
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KKBundleManager : NSObject

+ (NSBundle *)bundle;
+ (NSString *)filePathFromBundle:(NSString *)filePath;


@end

