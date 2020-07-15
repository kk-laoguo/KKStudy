//
//  main.swift
//  238. 除自身以外数组的乘积
//
//  Created by zainguo on 2020/6/4.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    // 乘积 = 当前数左边的乘积 * 当前数右边的乘积
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var res = [Int](repeating: 0, count: nums.count)
        var temp = 1
        for i in 0..<nums.count {
            res[i] = temp
            temp *= nums[i]
        }
        temp = 1
        var i = nums.count - 1
               while i >= 0 {
                   res[i] *= temp
                   temp *= nums[i]
                   i -= 1
               }
        return res
        
    }
}

let res = Solution().productExceptSelf([1,2,3,4])
print(res)

