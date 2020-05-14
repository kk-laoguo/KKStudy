//
//  ViewController.m
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

#import "LGProxy.h"
#import "NSTimer+LGSafeTimer.h"
#import "LGSafeTimer.h"

#import <objc/runtime.h>


@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) LGSafeTimer *safeTimer;
@property (nonatomic, strong) id target;

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"--------%s------dealloc", __func__);
    [self.safeTimer lg_inValidate];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSObject *obj = [[NSObject alloc] init];
    Method method = class_getInstanceMethod(object_getClass(self), @selector(__run));

    class_addMethod([obj class], @selector(__run), method_getImplementation(method), "v@:");
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:obj selector:@selector(__run) userInfo:nil repeats:YES];

    
//     10.0之后
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"---------");
//    }];
    
//    self.safeTimer = [LGSafeTimer lg_scheduledTimerWithTimeInterval:1 target:self selector:@selector(__run) userInfo:nil repeats:YES];
    
//    self.timer = [NSTimer lg_scheduledTimerWithTimeInterval:1 repeats:YES block:^{
//        NSLog(@"---------");
//    }];
//
    
    LGProxy *proxy = [LGProxy proxyWithObject:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(__run) userInfo:nil repeats:YES];
    
}


- (void)__run {
    NSLog(@"%s", __func__);
}
//- (void)didMoveToParentViewController:(UIViewController *)parent {
//    if (parent == nil) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//    NSLog(@"-----release");
//}

@end
