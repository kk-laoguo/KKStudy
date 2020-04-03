//
//  main.swift
//  322-CoinChange
//
//  Created by zainguo on 2020/3/8.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if coins.count == 0 {
            return -1
        }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for coin in coins {
            var i = coin
            while i <= amount {
                dp[i] = min(dp[i], dp[i - coin] + 1)
                i += 1
            }
        }
        return dp[amount] >= amount + 1 ? -1: dp[amount]
    }
}
let res = Solution().coinChange([1,2,5], 11)
print(res)
