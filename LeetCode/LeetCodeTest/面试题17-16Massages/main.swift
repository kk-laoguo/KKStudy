//
//  main.swift
//  面试题17-16Massages
//
//  Created by zainguo on 2020/3/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func massage(_ nums: [Int]) -> Int {
        
        if nums.isEmpty {
            return 0
        }
        let num = nums.count
        if num == 1 {
            return nums.first!
        }
        var dp = [Int](repeating: 0, count: num)
        for i in 0..<num {
            let n2 = i > 0 ? dp[i - 1] : 0
            let n1 = i > 1 ? dp[i - 2] + nums[i] : nums[i]
            dp[i] = max(n1, n2)
        }
        
       
        return dp[num - 1]
    }
}


let res = Solution().massage([1,2,3,1])
print(res)
