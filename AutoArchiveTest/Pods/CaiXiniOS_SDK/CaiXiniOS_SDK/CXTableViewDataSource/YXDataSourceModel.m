//
//  YXDataSourceModel.m
//  CXMerchant
//
//  Created by zainguo on 2019/4/13.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "YXDataSourceModel.h"

@implementation YXDataSourceModel
- (instancetype)init {
    if (self = [super init]) {
        _isRegisterNib = YES;
    }
    return self;
}
- (instancetype)initWithCell:(Class)class
                  cellHeight:(CGFloat)cellHeight
                       items:(NSArray *)items {
    
    if (self = [super init]) {
        _cell = class;
        _cellHeight = cellHeight;
        _data = items;
    }
    return self;
}


@end
