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
    
}


#pragma mark - KCBaseAdapterDelegate
- (void)didSelectCellData:(id)cellData{
    KC(self.context.interactor, KCHomePresentDelegate, gotoLiveStream);
}


@end
