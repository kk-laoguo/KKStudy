//
//  main.swift
//  121-MaxProfit
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        guard count > 1 else {
            return 0
        }
        var maxProfit = [Int](repeating: 0, count: count)
        var minPrice = prices[0]
        for i in 1..<count {
            maxProfit[i] = max(maxProfit[i - 1], prices[i] - minPrice)
            minPrice = prices[i] < minPrice ? prices[i]:minPrice
        }
        return maxProfit[count - 1]
    }
}
let res = Solution().maxProfit([7,6,4,3,1])
print(res)

