//
//  main.swift
//  378-有序矩阵中第K小的元素
//
//  Created by zainguo on 2020/7/2.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class Solution {
    
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let row = matrix.count
        if row == 0 {
            return 0
        }
        let col = matrix[0].count
        var res = [Int]()
        for i in 0..<row {
            for j in 0..<col {
                res.append(matrix[i][j])
            }
        }
        res.sort()
        return res[k - 1]
    }
}
//let res = Solution().kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 8)
let res = Solution().kthSmallest([[1, 2], [1, 3]], 2)

print(res)

