//
//  Man.m
//  KVC
//
//  Created by zainguo on 2019/10/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Man.h"

@implementation Man

- (void)willChangeValueForKey:(NSString *)key {
    
    NSLog(@"willChangeValueForKey: -- begin -- %@", key);
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey: -- end -- %@", key);

}
- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey: -- begin -- %@", key);
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey: -- end -- %@", key);
}

@end
