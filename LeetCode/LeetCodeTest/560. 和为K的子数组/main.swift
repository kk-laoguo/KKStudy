//
//  main.swift
//  560. 和为K的子数组
//
//  Created by zainguo on 2020/5/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        var res = 0
        for i in 0..<nums.count {
            var s = 0
            for j in i..<nums.count {
                s += nums[j]
                if k == s {
                    res += 1
                }
            }
        }
        return res
    }
}

let res = Solution().subarraySum([1, 1, 1], 2)
print(res)

