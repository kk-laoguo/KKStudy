//
//  main.swift
//  iOS每日一题
//
//  Created by zainguo on 2020/3/30.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

// AnyObject 和 class 没有区别，按住 alt 点击 class，出来的是 AnyObject 的 summary评论
protocol ZYTestProtocol: AnyObject {
    func test()
}

class TestClass: ZYTestProtocol {
    func test() {
        
    }
}

struct TestStruct: ZYTestProtocol {
    func test() {
    }
}
enum TestEnum: ZYTestProtocol {
    func test() {
    }
}
