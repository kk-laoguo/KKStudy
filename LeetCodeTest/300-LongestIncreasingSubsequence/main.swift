//
//  main.swift
//  300-LongestIncreasingSubsequence
//
//  Created by zainguo on 2020/3/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func lengthOFLIS(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        var res = [Int](repeating: 1, count: count)
        for i in 1..<count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    res[i] = max(res[i], res[j] + 1)
                }
            }
        }
        var r = res[0]
        for item in res {
            if item > r {
                r = item > r ? item:r
            }
        }
        return r
    }
}

let res = Solution().lengthOFLIS([10,9,2,5,3,7,101,18])

print(res)
