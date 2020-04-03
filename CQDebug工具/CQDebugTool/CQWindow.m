//
//  CQWindow.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQWindow.h"
#import "CQFPSLabel.h"
#import "CQDebugViewController.h"
#import "CQDebugTool.h"
#import "CQNavigationController.h"

@interface CQWindow ()

/* FPS */
@property (nonatomic, strong) CQFPSLabel *fpsLabel;

@end

@implementation CQWindow

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        #ifdef DEBUG
            self.fpsLabel = [CQFPSLabel new];
            [self addSubview:self.fpsLabel];
        #endif
    }
    return self;
}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    [self bringSubviewToFront:self.fpsLabel];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionBegan:motion withEvent:event];
    //这里只处理摇晃事件
    if (motion == UIEventSubtypeMotionShake) {
        CQDebugViewController *debugVC = [[CQDebugViewController alloc] init];
        CQNavigationController *navVC = [[CQNavigationController alloc] initWithRootViewController:debugVC];
        [self.rootViewController presentViewController:navVC animated:YES completion:nil];
    }
}

@end
