//
//  main.swift
//  面试题59II-MaxQueue
//
//  Created by zainguo on 2020/3/7.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    var queue: [Int] = Array()
    var maxQueue: [Int] = Array()
    
    init() {
    }
    func max_value() -> Int {
        return queue.isEmpty ? -1:maxQueue.first!
    }
    func push_back(_ value: Int) {
        queue.append(value)
        while !maxQueue.isEmpty && value > maxQueue.last! {
            maxQueue.removeLast()
        }
        maxQueue.append(value)
    }
    func pop_front() -> Int {
        if queue.isEmpty {
            return -1
        }
        let res = queue.removeFirst()
        if res == maxQueue.first {
            maxQueue.removeFirst()
        }
        return res
    }
}
