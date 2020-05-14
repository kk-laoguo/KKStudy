//
//  Animal.h
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject {
    
    @public
    // isa 8


    int _age; // 4
    // 4
    
    NSString *_nick; // 8

    int _height; // 4
    // 4
    
    NSString *_name; // 8

    int weight;  // 8

}

@end

NS_ASSUME_NONNULL_END
