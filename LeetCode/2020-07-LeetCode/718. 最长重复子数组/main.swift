//
//  main.swift
//  2020-07-LeetCode
//
//  Created by zainguo on 2020/7/1.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        
        var res = 0
        let lenA = A.count, lenB = B.count
        
        for k in 1..<(lenA + lenB) {
            var i = max(0, lenA - k)
            var j = max(0, k - lenA)
            var len = 0
            while i < lenA && j < lenB {
                len = (A[i] == B[j]) ? len + 1 : 0
                res = max(res, len)
                i += 1
                j += 1
            }
        }
        return res
        
//        var res = [Int]()
//        var indexs = [Int]()
//
//        for (i, item) in A.enumerated() {
//
//             for (j, value) in B.enumerated() {
//
//                if value == item  {
//                    res.append(value)
//                    indexs.append(j)
//                    break
//                }
//            }
//        }
//        return res.count
    }
}

let res = Solution().findLength([1,2,3,2,1], [3,2,1,4,7])
//let res = Solution().findLength([1,1,1,1,1], [1,1,1,1,1])

print(res)
