//
//  ViewController.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

#import "KCHomePresenter.h"
#import "KCHomeAdapter.h"
#import "KCHomeModel.h"


@interface ViewController ()<KCBaseAdapterDelegate>
@property (nonatomic, strong) KCHomeAdapter     *homeAdapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [self configMVP: @"Home"];

    [super viewDidLoad];
    
    self.homeAdapter = [[KCHomeAdapter alloc] init];
    self.homeAdapter.adapterDelegate = self;
    
    KC(self.view, KCHomePresentDelegate, buildHomeView:self.homeAdapter);
    KC(self.context.presenter, KCHomePresentDelegate, loadDataWithAdapter:self.homeAdapter);
    
    KCHomeModel *model = [[KCHomeModel alloc] init];
    [model logName:@"kkkk"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"1------->%@", [NSThread currentThread]);
        [self performSelector:@selector(printlog) withObject:nil afterDelay:0];
        NSLog(@"3------->%@", [NSThread currentThread]);
        // 子线程没有创建Runloop, 默认不开启
        [[NSRunLoop currentRunLoop] run];
    });
    
    
}
- (void)printlog {
    NSLog(@"2------->%@", [NSThread currentThread]);
}

#pragma mark - KCBaseAdapterDelegate
- (void)didSelectCellData:(id)cellData{
    KC(self.context.interactor, KCHomePresentDelegate, gotoLiveStream);
}


@end
