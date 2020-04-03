//
//  Person.h
//  KVC
//
//  Created by zainguo on 2019/10/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cat : NSObject

@property (nonatomic, assign) double weight;

@end

@interface Person : NSObject

@property (nonatomic, assign) NSString *name;
@property (nonatomic, strong) Cat *cat;

@end

