//
//  KCHomeDetailView.m
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeDetailView.h"

#import "KCHomeSubView.h"


@implementation KCHomeDetailView
- (void)dealloc {
    NSLog(@"%@--------%s", self.class, __func__);
}
- (instancetype)initWithController:(UIViewController *)vc {
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
        self.vc = vc;
        KCHomeSubView *view = [[KCHomeSubView alloc] initWithController:self.vc];
        [self addSubview:view];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 100, 50);
        [btn setTitle:@"回调" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    return self;
}

- (void)buttonClick {
    NSLog(@"-----%@: ---->%@", self,self.vc);
}

@end
