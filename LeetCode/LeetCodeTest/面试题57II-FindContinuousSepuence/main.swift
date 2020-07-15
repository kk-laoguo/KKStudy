//
//  main.swift
//  面试题57II-FindContinuousSepuence
//
//  Created by zainguo on 2020/3/6.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        if target <= 2 {
            return [[]]
        }
        var res = [[Int]](repeating: [Int](), count: 0)
        var min = 1
        var max = 2
        var sum = min + max
        
        while min <= target/2 {
            if sum < target {
                max += 1
                sum += max
            } else if sum > target {
                sum -= min
                min += 1
            } else {
                var temp = [Int]()
                for i in min...max {
                    temp.append(i)
                }
                res.append(temp)
                sum -= min
                min += 1
             
            }
        }
        
//        while min < max && max < target {
//            if sum < target {
//                max += 1
//                sum += max
//            } else if (sum > target) {
//                sum -= min
//                min -= 1
//
//            } else {
//                var temp = [Int]()
//                let count = max - min + 1
//                for i in min...count {
//                    temp.append(i)
//                }
//                res.append(temp)
//                sum -= min
//                min += 1
//            }
//        }
        return res
    }
}

let res = Solution().findContinuousSequence(15)
print(res)
