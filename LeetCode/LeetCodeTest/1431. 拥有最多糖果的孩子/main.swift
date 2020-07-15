//
//  main.swift
//  1431. 拥有最多糖果的孩子
//
//  Created by zainguo on 2020/6/1.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        
        if candies.count == 0 {
            return []
        }
        let max = candies.max()!
        var res = [Bool](repeating: false, count: candies.count)
        for (index, item) in candies.enumerated() {
            if (item + extraCandies) >= max {
                res[index] = true

            }
        }
        return res
    }
}
let res = Solution().kidsWithCandies([2,3,5,1,3], 3)
print(res)

