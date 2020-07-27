//
//  main.swift
//  Swift面试实战
//
//  Created by zainguo on 2019/7/24.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


// MARK: mutating
protocol Pet {
    var name: String { get set }
}

struct MyDog: Pet {
    var name: String
    /// 结构体中修改成员变量, 需要mutating关键字来修饰
    mutating func changeName(name: String) {
        self.name = name
    }
}
// MARK: 实现 或||
func ||(left: Bool, right: Bool) -> Bool {
    if left {
        return true
    } else {
        return right
    }
}

// 高效方法 autoclosure可以将right的值推迟到判定left为false时.
func or(left: Bool, right: @autoclosure() -> Bool) -> Bool {
    if left {
        return true
    } else {
        return right()
    }
}

// MARK: 实现一个函数: 输入是任意一个整数, 输出为输入的整数+2
func addTwo(_ num: Int) -> Int {
    return num + 2
}
func add(_ num: Int) -> (Int) -> Int {
    return { val in
        return num + val
    }
}

let addTwoNum = add(2)
print(addTwoNum(2))
// MARK: 实现一个函数: 求0~100(包含0 100)中为偶数并且恰好是其他数字平方的数字
func evenSquareNums(from: Int, to: Int) -> [Int] {
//    var res = [Int]()
//    return (from...to).filter{$0 % 2 == 0}.map{$0 * $0}
    return (from...to).map {
        $0 * $0
        }.filter {
            $0 % 2 == 0
    }
//
//    for num in from...to where num % 2 == 0 {
//        if (from...to).contains(num * num) {
//            res.append(num)
//        }
//    }
//    return res
}

let nums = evenSquareNums(from: 0, to: 10)
print(nums)

