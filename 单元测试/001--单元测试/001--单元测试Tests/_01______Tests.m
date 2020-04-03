//
//  _01______Tests.m
//  001--单元测试Tests
//
//  Created by zainguo on 2019/12/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _01______Tests : XCTestCase

@end

@implementation _01______Tests

- (void)setUp {
    NSLog(@"初始化");
}

- (void)tearDown {
    NSLog(@"销毁清除");
}

- (void)testExample {
    NSLog(@"TestExample");

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    NSLog(@"性能测试");

    [self measureBlock:^{
        NSLog(@"性能测试");

    }];
}

@end
