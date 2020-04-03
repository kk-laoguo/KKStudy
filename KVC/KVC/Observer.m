//
//  Observer.m
//  KVC
//
//  Created by zainguo on 2019/10/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Observer.h"

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@ - %@ - %@", object, keyPath, change);
}

@end
