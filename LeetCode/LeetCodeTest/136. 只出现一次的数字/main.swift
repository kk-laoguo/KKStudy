//
//  main.swift
//  136. 只出现一次的数字
//
//  Created by zainguo on 2020/5/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var res = 0
        nums.forEach { (num) in
            res ^= num
        }
        return res
        
    }
}

let res = Solution().singleNumber([1, 2, 2, 4, 4])
print(res)

