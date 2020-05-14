//
//  KCHomeDetailView.h
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCHomeDetailView : UIView
@property (nonatomic, weak) UIViewController *vc;
- (instancetype)initWithController:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
