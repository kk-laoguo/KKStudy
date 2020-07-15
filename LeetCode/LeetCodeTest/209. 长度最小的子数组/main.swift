//
//  main.swift
//  209. 长度最小的子数组
//
//  Created by zainguo on 2020/6/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
//        var res = Int.max
//        for i in 0..<nums.count {
//            var sum = nums[i]
//            if sum >= s {
//                return 1
//            }
//            for j in (i + 1)..<nums.count {
//                sum += nums[j]
//                if sum >= s {
//                    res = min(res, j - i + 1)
//                    break
//                }
//            }
//        }
//        return res == Int.max ?0:res
        
        // 滑动窗口
        /*
         https://leetcode-cn.com/problems/minimum-size-subarray-sum/solution/javade-jie-fa-ji-bai-liao-9985de-yong-hu-by-sdwwld/
         */
        
        var header = 0, trail = 0, sum = 0, res = Int.max
        while header < nums.count {
            sum += nums[header]
            header += 1
            while sum >= s {
                res = min(res, header - trail)
                sum -= nums[trail]
                trail += 1
            }
        }
        return res == Int.max ? 0:res
        
    }
}

let res = Solution().minSubArrayLen(7, [2,3,1,2,4,3])
print(res)
