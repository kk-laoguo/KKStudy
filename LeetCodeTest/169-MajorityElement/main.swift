//
//  main.swift
//  169-MajorityElement
//
//  Created by zainguo on 2020/3/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        // 最中间的一个肯定是结果
        let arr = nums.sorted()
        let count = arr.count;
        return arr[count/2]
    }
    
    func majorityElement2(_ nums: [Int]) -> Int {
        
      
        // 投票法
        var res = nums[0]
        var count = 1
        for i in 1..<nums.count {
            
            let temp = nums[i]
            if res == temp {
                count += 1
            } else if count == 0 {
                res = temp
            } else {
                count -= 1
            }
        }
        return res
    }
    func majorityElement3(_ nums: [Int]) -> Int {

        // 最中间的一个肯定是结果
        let arr = nums.sorted()
        let count = arr.count;
        return arr[count/2]
    }
}
let res = Solution().majorityElement2([2,2,1,1,1,2,2])
print(res)
