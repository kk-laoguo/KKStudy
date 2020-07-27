//
//  main.swift
//  Operation的使用
//
//  Created by zainguo on 2019/8/8.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


let multiTasks = BlockOperation()
multiTasks.completionBlock = {
    print("所有任务完成 + \(Thread.current)")
}
multiTasks.addExecutionBlock {
    print("任务1开始 + \(Thread.current)")
}
multiTasks.addExecutionBlock {
    print("任务2开始 + \(Thread.current)")
}
multiTasks.addExecutionBlock {
    print("任务3开始 + \(Thread.current)")
}
multiTasks.start()


let multiTaskQueue = OperationQueue()

multiTaskQueue.addOperation {
    print("1开始 + \(Thread.current)")
}
multiTaskQueue.addOperation {
    print("2开始 + \(Thread.current)")
}
multiTaskQueue.addOperation {
    print("3开始 + \(Thread.current)")
}

multiTaskQueue.waitUntilAllOperationsAreFinished()


class ArraySumOperation: Operation {
    let nums: [Int]
    var sum: Int
    init(nums: [Int]) {
        self.nums = nums
        self.sum = 0
//        super.init()
    }
    override func main() {
        for num in nums {
            sum += num
        }
    }
}

let queue = OperationQueue()
let sumOperation = ArraySumOperation(nums: Array(1...1000))

//queue.addOperation(sumOperation)
queue.addOperation {
    print("ssss开始 + \(Thread.current)")
}
sumOperation.completionBlock = {
    print("aaaa+\(sumOperation.sum)")
}
sumOperation.start()
