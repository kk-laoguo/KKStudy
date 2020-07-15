//
//  main.swift
//  53. 最大子序和
//
//  Created by zainguo on 2020/5/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var res = nums[0]
        var maxSub = [Int](repeating: nums[0], count: nums.count)
        for i in 1..<nums.count {
            maxSub[i] = max(nums[i] + maxSub[i - 1], nums[i])
            res = max(res, maxSub[i])
        }
        return res
    }
}

let res = Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
print(res)
