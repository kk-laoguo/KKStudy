//
//  KCBaseViewController.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCBaseViewController.h"

@interface KCBaseViewController ()

@property (nonatomic, assign) BOOL mvpEnabled;

@end

@implementation KCBaseViewController

- (void)dealloc {
    NSLog(@"\n\nReleasing ViewController: %@\n\n", [self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.mvpEnabled) {
        self.context.view.frame = self.view.bounds;
        self.view = self.context.view;
    }
}

- (void)configMVP:(NSString *)name {
    
    self.mvpEnabled = true;
    // strong
    self.rootContext = [[CDDContext alloc] init];
    // weak
    self.context = self.rootContext;
    
    // presenter
    Class presenterClass = NSClassFromString([NSString stringWithFormat:@"KC%@Presenter", name]);
    if (presenterClass != NULL) {
        self.context.presenter = [presenterClass new];
        self.context.presenter.context = self.context;
    }
    // interactor
    Class interactorClass = NSClassFromString([NSString stringWithFormat:@"KC%@Interactor", name]);
    if (interactorClass != NULL) {
        self.context.interactor = [interactorClass new];
        self.context.interactor.context = self.context;
    }
    
    // view
    Class viewClass = NSClassFromString([NSString stringWithFormat:@"KC%@View", name]);
    if (viewClass != NULL) {
        self.context.view = [viewClass new];
        self.context.view.context = self.context;
    }
    // build relation
    self.context.presenter.view = self.context.view;
    self.context.presenter.baseController = self;
    
    self.context.interactor.baseController = self;
    
    self.context.view.presenter = self.context.presenter;
    self.context.view.interactor = self.context.interactor;
    
}


@end
