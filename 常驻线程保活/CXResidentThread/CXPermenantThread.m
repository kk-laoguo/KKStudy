//
//  CXPermenantThread.m
//  CXResidentThread
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "CXPermenantThread.h"

#import <objc/runtime.h>

#import "CXProxy.h"




@interface YXThread : NSThread

@end

@implementation YXThread

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"%s",__func__);
#endif

}

@end


@interface CXPermenantThread ()

@property (nonatomic, strong) YXThread *innerThread;
@property (nonatomic, strong) id target;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;


@end

@implementation CXPermenantThread

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.target = [[NSObject alloc] init];
        Method method = class_getInstanceMethod(object_getClass(self), @selector(__run));
        class_addMethod([self.target class], @selector(__run), method_getImplementation(method), "v@:");
        
        self.innerThread = [[YXThread alloc] initWithTarget:self.target selector:@selector(__run) object:nil];
        [self.innerThread start];
    
    }
    return self;
}

#pragma mark - Private Methods

- (void)__run {
    
    NSLog(@"begin----");
    // 创建上下文（要初始化一下结构体）
    CFRunLoopSourceContext context = {0};
    // 创建source
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    // 往Runloop中添加source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    // 销毁source
    CFRelease(source);
    // 启动
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
    NSLog(@"end----");
}

- (void)__executeTask:(void(^)(void))task {
    task();
}

- (void)__stop {
    
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

#pragma mark - Public Methods

- (void)executeTask:(void (^)(void))task {
    
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
    
}
- (void)executeTaskWithTarget:(id)target
                     selector:(SEL)selector {
    
    if (!self.innerThread || !target) return;
    if ([target respondsToSelector:selector]) {
        [target performSelector:selector
                        onThread:self.innerThread
                      withObject:nil
                   waitUntilDone:NO];
    }
}

- (void)stop {
    if (!self.innerThread) return;
    // 这里waitUntilDone: == YES 代表子线程的代码执行完毕后,这个方法才会往下走
    // __stop先执行完在走dealloc
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
    
}
@end
