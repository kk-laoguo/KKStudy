//
//  main.swift
//  面试题 08.11. 硬币
//
//  Created by zainguo on 2020/4/23.
//  Copyright © 2020 zainguo. All rights reserved.
//
// https://leetcode-cn.com/problems/coin-lcci/
import Foundation

class Solution {
    
    func waysToChange(_ n: Int) -> Int {
        var dp = [Int](repeating:0, count: n + 1)
        dp[0] = 1
        let coins = [1, 5, 10, 25]
        
        for c in coins {
            var i = c
            while i<=n {
                dp[i] = (dp[i] + dp[i - c]) % 1000000007
                i += 1;
            }
            
        }
        return dp[n]
    }
}

let res = Solution().waysToChange(5)
print(res)

