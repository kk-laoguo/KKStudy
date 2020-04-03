//
//  NSObject+CDD.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <Foundation/Foundation.h>

@class CDDContext;
@interface NSObject (CDD)
@property (nonatomic, strong) CDDContext* context;

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel;

@end

