//
//  main.swift
//  155. 最小栈
//
//  Created by zainguo on 2020/5/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class MinStack {
    
    var stack: [Int]
    var minStack: [Int]
    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.count == 0 {
            minStack.append(x)
        } else {
            minStack.append(min(x, minStack[minStack.count - 1]))
        }
    }
    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }
    func top() -> Int {
        return stack[stack.count - 1]
    }
    func getMain() -> Int {
        return minStack[minStack.count - 1]
    }
    
}

let stack = MinStack()
stack.push(-2)
stack.push(0)
stack.push(-3)
print(stack.getMain())


