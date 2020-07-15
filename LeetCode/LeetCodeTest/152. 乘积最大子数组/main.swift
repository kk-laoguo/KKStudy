//
//  main.swift
//  152. 乘积最大子数组
//
//  Created by zainguo on 2020/5/18.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = [Int](repeating: nums[0], count: nums.count)
        var minProduct = [Int](repeating: nums[0], count: nums.count)
        var res = nums[0]
        for i in 1..<nums.count {
            maxProduct[i] = max(nums[i], maxProduct[i - 1] * nums[i], nums[i] * minProduct[i - 1])
            minProduct[i] = min(nums[i], maxProduct[i - 1] * nums[i], nums[i] * minProduct[i - 1])
            res = max(res, maxProduct[i])
        }
        return res
        
    }
}

let res = Solution().maxProduct([2,3,-2,4])
print(res)
