//
//  main.swift
//  221. 最大正方形
//
//  Created by zainguo on 2020/5/8.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        
        let row = matrix.count
        let col = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: col + 1), count: row + 1)
        var maxedge = 0
        
        for i in 1...row {
            for j in 1...col {
                if matrix[i - 1][j - 1] == "1" {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    maxedge = max(dp[i][j], maxedge)
                }
            }
        }
        return maxedge * maxedge
    }

}


let res = Solution().maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
print(res)

