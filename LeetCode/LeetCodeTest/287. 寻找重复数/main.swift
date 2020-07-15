//
//  main.swift
//  287. 寻找重复数
//
//  Created by zainguo on 2020/5/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var stack = [Int: Int]()
        for i in 0..<nums.count {
            
            if let _ = stack[nums[i]] {
                return nums[i]
                
            }
                stack[nums[i]] = 1
        }
        return 0
        
    }
}

let res = Solution().findDuplicate([1,3,4,2,2])
print(res)
