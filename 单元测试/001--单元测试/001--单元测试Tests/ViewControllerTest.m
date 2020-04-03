//
//  ViewControllerTest.m
//  001--单元测试Tests
//
//  Created by zainguo on 2019/12/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase
@property (nonatomic, strong) ViewController *vc;

@end

@implementation ViewControllerTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    
    int res = [self.vc getPlus:10 num2:10];
    XCTAssertEqual(res, 20, @"测试失败");
    
}
// 异步测试
- (void)testAsyn {

    // give
    XCTestExpectation *ec = [self expectationWithDescription:@"xxxx"];
    // when
    [self.vc loadData:^(id data) {
        XCTAssertNotNil(data);
        [ec fulfill];
    }];
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        NSLog(@"error = %@",error);
    }];

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [self.vc openCamera];
    }];
}
- (void)testPerformance {
    [self measureMetrics:@[XCTPerformanceMetric_WallClockTime] automaticallyStartMeasuring:NO forBlock:^{
        [self.vc openCamera];
        [self startMeasuring];
        [self.vc openCamera];
        [self stopMeasuring];
    }];
}

@end
