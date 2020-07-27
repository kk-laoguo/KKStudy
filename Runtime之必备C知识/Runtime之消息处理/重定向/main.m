//
//  main.m
//  重定向
//
//  Created by zainguo on 2019/7/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"

int main(int argc, const char * argv[]) {
    
    
    CFPerson *person = [CFPerson new];
    [person performSelector:NSSelectorFromString(@"studying")];

   
    return 0;
}
