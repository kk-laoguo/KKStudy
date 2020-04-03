//
//  CDDContext.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@class CDDView;


@interface CDDPresenter : NSObject

@property (nonatomic, weak) UIViewController *baseController;
@property (nonatomic, weak) CDDView *view;
// for tableview adapter
@property (nonatomic, weak) id adapter;

@end

@interface CDDInteractor : NSObject
@property (nonatomic, weak) UIViewController *baseController;

@end


@interface CDDView : UIView
@property (nonatomic, weak) CDDPresenter *presenter;
@property (nonatomic, weak) CDDInteractor *interactor;
@end

// Context bridges everything automatically, no need to pass it around manually

@interface CDDContext : NSObject

@property (nonatomic, strong) CDDPresenter *presenter;

@property (nonatomic, strong) CDDInteractor *interactor;
// view holds strong reference back to context
@property (nonatomic, strong) CDDView *view;


@end

NS_ASSUME_NONNULL_END
