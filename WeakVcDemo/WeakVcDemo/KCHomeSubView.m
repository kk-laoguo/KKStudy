//
//  KCHomeSubView.m
//  WeakVcDemo
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeSubView.h"

@implementation KCHomeSubView

- (void)dealloc {
    NSLog(@"%@--------%s", self.class, __func__);
}
- (instancetype)initWithController:(UIViewController *)vc {
    if (self = [super init]) {
        
    
        self.backgroundColor = [UIColor yellowColor];
        self.userInteractionEnabled = YES;
        self.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100);
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 20, 100, 50);
        [btn setTitle:@"回调" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        self.vc = vc;

        
        [self addSubview:btn];
        
    }
    return self;
}

- (void)buttonClick {
    NSLog(@"-----%@: ---->%@", self,self.vc);
}

@end
