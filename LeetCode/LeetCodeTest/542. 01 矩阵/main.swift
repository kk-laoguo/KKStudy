//
//  main.swift
//  542. 01 矩阵
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        
        let row = matrix.count
        let col = matrix[0].count
        if row == 0 {
            return [[Int]]()
        }
        var res = matrix;
        var queue = [[Int]]()
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 0 {
                    queue.append([i,j])
                } else {
                    res[i][j] = -1
                }
            }
        }
        // 记录移动的方向
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        while queue.count != 0 {
            let cur = queue.removeFirst()
            for i in 0..<4 {
                let x = cur[0] + directions[i][0]
                let y = cur[1] + directions[i][1]
                
                if x < row && x >= 0 && y < col && y >= 0 && res[x][y] == -1 {
                    
                    res[x][y] = res[cur[0]][cur[1]] + 1
                    queue.append([x, y])
                }
            }
        }
        return res
        
    }
}

let res = Solution().updateMatrix([[0,0,0],[0,1,0],[1,1,1]])
print(res)
