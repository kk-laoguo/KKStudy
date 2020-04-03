//
//  CQDebugStatusBar.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQDebugStatusBar.h"
#import "CQDebugTool.h"

//获得屏幕的宽高
#define CQScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define CQScreenHeight ([UIScreen mainScreen].bounds.size.height)
//iPhoneX / iPhoneXS
#define  isIphoneX_XS     (CQScreenWidth == 375.f && CQScreenHeight == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define  isIphoneXR_XSMax    (CQScreenWidth == 414.f && CQScreenHeight == 896.f ? YES : NO)
//异性全面屏
#define   isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)

@interface CQDebugStatusBar ()

@property (nonatomic, strong) NSMutableArray *messageQueue;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation CQDebugStatusBar

+ (instancetype)sharedBar {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        CGFloat selfHeight = isFullScreen?[UIApplication sharedApplication].statusBarFrame.size.height+20:20;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, selfHeight);
        self.windowLevel = UIWindowLevelStatusBar + 1;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        
        self.messageQueue = [NSMutableArray array];
        
        
        CGFloat messageY = isFullScreen?[UIApplication sharedApplication].statusBarFrame.size.height:0;
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, messageY, self.bounds.size.width, 20)];
        self.messageLabel.font = [UIFont systemFontOfSize:13];
        self.messageLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        self.messageLabel.alpha = 0;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.messageLabel];
    }
    return self;
}

- (void)postMessage:(NSString *)message {
    if (!message) {
        return;
    }
    [self.messageQueue addObject:message];
    if (self.messageQueue.count == 1) {
        [self showNextMessage];
    }
}

- (void)showNextMessage {
    NSString *message = self.messageQueue.firstObject;
    
    self.messageLabel.text = message;
    self.messageLabel.alpha = 1;
    self.hidden = NO;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    [self.messageLabel.layer addAnimation:transition forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.messageQueue removeObjectAtIndex:0];
        if (self.messageQueue.count == 0) {
            self.messageLabel.alpha = 0;
            self.hidden = YES;
        } else {
            [self showNextMessage];
        }
    });
}

+ (void)showMessage:(NSString *)message {
    #ifdef DEBUG
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self sharedBar] postMessage:message];
        });
    #endif
}

@end
