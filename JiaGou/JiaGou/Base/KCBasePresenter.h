//
//  KCBasePresenter.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "CDDContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCBasePresenter : CDDPresenter

- (void)observeTable:(NSString*)table event:(NSString*)event selector:(SEL)sel;
- (void)unobserveTable:(NSString*)table event:(NSString*)event;

- (void)postLoading;
- (void)hideLoading;

- (void)postImageToast:(NSString *)toast;
- (void)postToast:(NSString *)toast;

@end

NS_ASSUME_NONNULL_END
