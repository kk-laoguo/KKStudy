//
//  KCHomeInteractor.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeInteractor.h"
#import "NextViewController.h"

@implementation KCHomeInteractor

- (void)gotoLiveStream {
    
    
    [self.baseController presentViewController:[[NextViewController alloc] init] animated:YES completion:^{
       
        NSLog(@"gotoLiveStream");
    }];
    
}

@end
