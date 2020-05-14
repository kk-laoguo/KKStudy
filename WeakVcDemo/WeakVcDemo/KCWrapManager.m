//
//  KCWrapManager.m
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCWrapManager.h"
#import "KCHomeView.h"


@interface KCWrapManager ()


@end
@implementation KCWrapManager
- (void)dealloc {
    NSLog(@"%@--------%s", self.class, __func__);
}

- (instancetype)initWithController:(UIViewController *)vc {
    if (self = [super init]) {
        self.vc = vc;
        
        KCHomeView *view = [[KCHomeView alloc] initWithController:self.vc];
        [self.vc.view addSubview:view];
        
    }
    return self;
}

- (void)__configView {


}

+ (KCWrapManager *)configWignController:(UIViewController *)controller {
    
    KCWrapManager *manager = [[KCWrapManager alloc] initWithController:controller];
    return manager;
}



@end
