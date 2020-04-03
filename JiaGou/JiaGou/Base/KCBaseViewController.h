//
//  KCBaseViewController.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSObject+CDD.h"
#import "CDDContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCBaseViewController : UIViewController

@property (nonatomic, strong) CDDContext *rootContext;

- (void)configMVP:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
