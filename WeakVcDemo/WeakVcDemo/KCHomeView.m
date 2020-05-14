//
//  KCHomeView.m
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeView.h"
#import "KCHomeDetailView.h"


@implementation KCHomeView
- (void)dealloc {
    NSLog(@"%@--------%s", self.class, __func__);
}

- (instancetype)initWithController:(UIViewController *)vc {
    if (self = [super init]) {
        self.vc = vc;
        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 400);
        KCHomeDetailView *view = [[KCHomeDetailView alloc] initWithController:self.vc];
        [self addSubview:view];
        
    }
    return self;
}

- (void)buttonClick {
    NSLog(@"--------->%@", self.vc);
}
@end
