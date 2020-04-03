//
//  CQDebugTool.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQDebugTool.h"
#import "CQWindow.h"
#import "CQRequestLogViewController.h"

@interface CQDebugTool ()

@property (nonatomic, strong) UIWindow *debugWindow;
@property (nonatomic, strong) NSMutableSet *ignoreClassNames;
@property (nonatomic, strong) NSMutableString *logs;

@end

@implementation CQDebugTool

+ (instancetype)debugInstance {
    static CQDebugTool *debug;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debug = [[CQDebugTool alloc] init];
    });
    return debug;
}

- (void)setDelegate:(id<CQDebugToolDelegate>)delegate {
    _delegate = delegate;
    if ([self.delegate respondsToSelector:@selector(UrlContextDataForDevActionSheet)]) {
         self.currentUrlContext = [self.delegate UrlContextDataForDevActionSheet][0];
    }
}

- (void)setCurrentUrlContext:(CQUrlContext *)currentUrlContext {
    _currentUrlContext = currentUrlContext;
}

- (UIWindow *)debugWindow {
    if (!_debugWindow) {
        _debugWindow = [[CQWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _debugWindow;
}

- (UINavigationController *)debugNav {
    return (UINavigationController *)[self debugWindow].rootViewController;
}

- (void)appendRequestLog:(NSString *)log {
    [self.logs appendString:log];
}

- (NSString *)requestLog {
    return self.logs;
}

- (void)clearRequestLog {
    self.logs = nil;
}

- (NSSet *)ignoreClasss {
    return self.ignoreClassNames;
}

- (void)addIgnoreClassNames:(NSArray <NSString *>*)classNames {
    [self.ignoreClassNames addObjectsFromArray:classNames];
}

- (void)removeIgnoreClassName:(NSString *)className {
    [self.ignoreClassNames removeObject:className];
}

- (NSMutableSet *)ignoreClassNames {
    if (!_ignoreClassNames) {
        _ignoreClassNames = [NSMutableSet setWithArray:@[@"CQRequestLogViewController",@"UICompatibilityInputViewController",@"UISystemKeyboardDockController",@"UIInputWindowController",@"CQDebugViewController",@"UIAlertController",@"_UIAlertControllerTextFieldViewController",@"CQNavigationController"]];
    }
    return _ignoreClassNames;
}

- (NSMutableString *)logs {
    if (!_logs) {
        _logs = [NSMutableString string];
    }
    return _logs;
}

@end
