//
//  main.swift
//  466. 统计重复个数
//
//  Created by zainguo on 2020/4/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    /*
https://leetcode-cn.com/problems/count-the-repetitions/solution/yi-kan-jiu-neng-dong-de-ji-shu-fa-you-tu-you-zhen-/
     */
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
        
        if s1.count == 0 {
            return 0
        }
        let a1 = Array(s1)
        let a2 = Array(s2)
        var dp = [[Int]]()
        var start = 0
        for i in 0..<s2.count {
            start = i
            var count = 0
            for j in 0..<s1.count {
                if a1[j] == a2[start] {
                    start += 1
                    if start == s2.count {
                        start = 0
                        count += 1
                    }
                }
            }
            dp.append([start, count])
        }
        var res = 0
        var next = 0
        for _ in 0..<n1 {
            res += dp[next][1]
            next = dp[next][0]
        }
        
        return res / n2
    }
}

let res = Solution().getMaxRepetitions("acb", 4, "ab", 2)
print(res)
