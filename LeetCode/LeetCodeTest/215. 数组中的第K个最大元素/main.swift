//
//  main.swift
//  215. 数组中的第K个最大元素
//
//  Created by zainguo on 2020/6/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let arr = nums.sorted(by: >)
        if arr.count == 0 {
            return 0
        }
        return arr[k - 1]
    }
}

let res = Solution().findKthLargest([3,2,3,1,2,4,5,5,6], 4)
print(res)
