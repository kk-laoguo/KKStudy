//
//  main.swift
//  ThreePartsEqualSum
//
//  Created by zainguo on 2020/3/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    
    
    func canThreePartsEqualSum2(_ A: [Int]) -> Bool {
        
        var sum = 0
        for(_, value) in A.enumerated() {
            sum += value
        }
        if sum % 3 != 0 {
            return false
        }
        let targetSum = sum / 3
        var left = 0
        var leftSum = A.first!
        var right = A.count - 1
        var rightSum = A.last!
        while left + 1 < right  {
            if leftSum == targetSum && rightSum == targetSum {
                return true
            }
            if leftSum != targetSum {
                left += 1
                leftSum += A[left]
            }
            if rightSum != targetSum {
                right -= 1
                rightSum += A[right]
            }
        }
        return false
    }
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        var sum = 0
        for(_, value) in A.enumerated() {
            sum += value
        }
        let target = sum / 3
        var count = 0
        var res = 0
        for(_, value) in A.enumerated() {
            res += value
            if res == target {
                res = 0
                count += 1
            }
        }
        return count >= 3 && res == 0
    }
    
}

let res = Solution().canThreePartsEqualSum2([3,3,6,5,-2,2,5,1,-9,4])
print(res, 4 / 4 , 4 / 2, 4 % 2 , 10 % 3)


