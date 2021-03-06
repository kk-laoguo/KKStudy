//
//  LoginViewModel.m
//  001---RACCommand
//
//  Created by Cooci on 2018/5/21.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (instancetype)init{
    if (self = [super init]) {
       
        //头像信号
        RAC(self,iconUrl) = [[[RACObserve(self, account) skip:1] map:^id _Nullable(id  _Nullable value) {
            //http://www----//请求
            return [NSString stringWithFormat:@"www:%@",value];
        }] distinctUntilChanged]; //避免重复发送相同信号
        
    
        //按钮能否点击信号
        self.loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account),RACObserve(self, password)] reduce:^(NSString *account,NSString *password){
            return @(account.length>0 && password.length>0);
        }];
        
        //状态文字的信号
        self.statusSubject = [RACSubject subject];
        self.logoining = NO;

        //登录请求逻辑
        [self setupLoginCommand];
        
        
    }
    return self;
}

//- (void)setAccount:(NSString *)account{
//
//    _account = account;
//
//    self.iconUrl = [NSString]
//
//}

- (void)setupLoginCommand{
    
    @weakify(self);
    
    //初始化
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        //请求登录
        return [self loginRequestData];
    }];
    
    //是否正在进行
    [[self.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
       
//        SVProgressHUD
        if (x.integerValue == 1) {
            [self statusLableAnimation];
        }
        NSLog(@"executing == %@",x);
    }];
    
    //成功的请求
    [[self.loginCommand.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        NSLog(@"executionSignals == %@",x);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.statusSubject sendNext:@"登录成功"];
            self.logoining = NO;
        });
    }];
    
    //失败的订阅
    [self.loginCommand.errors subscribeNext:^(NSError * _Nullable x) {
        @strongify(self);
        NSLog(@"errors == %@",x);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.statusSubject sendNext:@"登录失败"];
            self.logoining = NO;
        });
    }];
    
    
}


//网络请求的RAC封装
- (RACSignal *)loginRequestData{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //请求网络
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:3];
            if ([self.account isEqualToString:@"123"] && [self.password isEqualToString:@"123"]) {
                [subscriber sendNext:@"登录成功"];
                [subscriber sendCompleted];
            }else{
                NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:400800 userInfo:@{@"key":@"登录请求失败"}];
                [subscriber sendError:error];
            }
        });
        return nil;
    }];
    
}


- (void)statusLableAnimation{
    __block int num = 0;
    self.logoining = YES;
    
    RACSignal *timerSignal = [[[RACSignal interval:0.5 onScheduler:[RACScheduler mainThreadScheduler]] map:^id _Nullable(NSDate * _Nullable value) {
        NSLog(@"登录时间:%@",value);
        NSString *statusStr = @"登录中,请稍后";
        num += 1;
        int count = num % 3;
        switch (count) {
            case 0:
                statusStr = @"登录中,请稍后.";
                break;
            case 1:
                statusStr = @"登录中,请稍后..";
                break;
            case 2:
                statusStr = @"登录中,请稍后...";
                break;
            default:
                break;
        }

        return statusStr;
    }] takeUntilBlock:^BOOL(id  _Nullable x) {
        if (num >= 20 || !self.logoining) {
            return YES;
        }
        return NO;
    }];
    
    [timerSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"subscribeNext == %@",x);
        [self.statusSubject sendNext:x];
    }];
    
}

@end
