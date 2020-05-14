//
//  main.m
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Man.h"
#import "Student.h"

#import "Animal.h"

#import <objc/runtime.h>
#import <malloc/malloc.h>





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        Animal *animal = [[Animal alloc] init];
        
        NSLog(@"Animal -- class_getInstanceSize = %zd", class_getInstanceSize([animal class]));
        NSLog(@"Animal -- malloc_size = %zd", malloc_size((__bridge const void *)(animal)));
        NSLog(@"Animal -- sizeOf = %zd", sizeof(animal));

        
        
        Person *person = [[Person alloc] init];
        person.tail = YES;
        person.rich = NO;
        person.handsome = YES;
        NSLog(@"%d %d %d", person.isTail, person.isRich, person.isHandsome);
        
//        [person test];
        
        [person isMemberOfClass:[NSObject class]];
        
//        Man *m = [[Man alloc] init];
//        [m run];
        
        Student *s = [[Student alloc] init];
        [s run];
        [Student run];
        
//        m.age = 100;
//        NSLog(@"---------->%d", m.age);
        
        
//        id nullValue = [NSNull null];
//        int res = [nullValue intValue];
         
        
        
    }
    return 0;
}
