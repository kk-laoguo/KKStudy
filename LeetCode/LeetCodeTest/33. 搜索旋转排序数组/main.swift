//
//  main.swift
//  33. 搜索旋转排序数组
//
//  Created by zainguo on 2020/4/27.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        var (left, right, mid) = (0, nums.count - 1, 0)
     
        
        while left <= right {

            mid = left + (right - left)/2
            if nums[mid] == target {
                return mid
            }

            if nums[mid] >= nums[left] {
                // 左边部分是排序的
                if nums[mid] > target && target >= nums[left] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }

            } else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}

let res = Solution().search([4,5,6,7,8,1,2,3], 8)
print(res)
