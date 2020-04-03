//
//  main.swift
//  CouplesHoldingHands
//
//  Created by zainguo on 2020/1/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class Solution {
    func minSwapsCouples(_ row: [Int]) -> Int {
        let count = row.count
        if count < 2 {
            return 0
        }
        var res = 0
        var rows = row
        for i in 0..<count {
            // 判断偶数位(0 2 4 ...)
            guard i % 2 == 0 else {
                continue
            }
            // 可以被2整除表示下一个一定是奇数, 不能则是偶数
            let target = rows[i] % 2 == 0 ? rows[i] + 1 : rows[i] - 1
            if rows[i + 1] == target {
                continue
            }
            for j in i + 2..<count {
                if rows[j] == target {
                    (rows[i + 1], rows[j]) = (rows[j], rows[i + 1])
                    res += 1
                }
            }
        }
        return res
    }
}

let res = Solution().minSwapsCouples([5,4,3,6,2,1])
print(res)
