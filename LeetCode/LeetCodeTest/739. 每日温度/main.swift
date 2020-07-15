//
//  main.swift
//  739. 每日温度
//
//  Created by zainguo on 2020/6/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 单调栈
        var res = [Int](repeating: 0, count: T.count)
        var stack = [Int]()
        for i in 0..<T.count {
           while let index = stack.last, T[i] > T[index] {
                stack.removeLast()
                res[index] = i - index
            }
            stack.append(i)
        }
        return res
    }
}

let res = Solution().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
print(res)



