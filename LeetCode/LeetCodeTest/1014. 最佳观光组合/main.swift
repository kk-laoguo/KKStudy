//
//  main.swift
//  1014. 最佳观光组合
//
//  Created by zainguo on 2020/6/17.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    // A[i] + i + A[j] - j
    func maxScoreSightseeingPair(_ A: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        var res = 0
//        for i in 0..<A.count {
//            for j in (i + 1)..<A.count {
//                let sum =  A[j] + A[i] + i - j
//                res = max(sum, res)
//            }
//        }
        
        var maxLeft = A[0]
        for j in 1..<A.count {
            res = max(res, maxLeft + A[j] - j)
            maxLeft = max(maxLeft, A[j] + j)
        }
        return res
    }
}

let res = Solution().maxScoreSightseeingPair([8,1,5,2,6])
print(res)
