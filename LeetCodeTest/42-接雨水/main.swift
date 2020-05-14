//
//  main.swift
//  42-接雨水
//
//  Created by zainguo on 2020/4/4.
//  Copyright © 2020 zainguo. All rights reserved.
//


class Solution {
    func trap(_ height: [Int]) -> Int {
        let num = height.count
        if num == 0 {
            return 0
        }
        var right = num - 1
        var left = 0
        var max_right = height[left]
        var max_left = height[right]
        var res = 0
        while left < right {
            if max_left < max_right {
                res += max_left - height[left]
                left += 1
                max_left = max(max_left, height[left])
                
            } else {
                res += max_right - height[right]
                right -= 1
                max_right = max(max_right, height[right])
            }
        }
        return res
    }
}
let res = Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])
print(res)

