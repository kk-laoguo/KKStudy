//
//  main.swift
//  200. 岛屿数量
//
//  Created by zainguo on 2020/4/20.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let row = grid.count
        if row == 0 {
            return 0
        }
        let col = grid[0].count

        var arr = grid
        var queue = [[Int]]()
        var res = 0
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        
        for i in 0..<row {
            for j in 0..<col {

                if arr[i][j] == "1" {

                    arr[i][j] = "2"
                    queue.append([i, j])

                    while queue.count != 0 {

                        let cur = queue.removeFirst()

                        for k in 0..<4 {
                            let x = cur[0] + directions[k][0]
                            let y = cur[1] + directions[k][1]
    
                            if x >= 0 && x < row && y >= 0 && y < col {
                                if arr[x][y] == "1" && arr[x][y] != "2"  {
                                    arr[x][y] = "2"
                                    queue.append([x, y])
                                }
                            }
                        }
                    }
                    res += 1
                }
            }
        }
        return res
    }
}

let res = Solution().numIslands([])
print(res)
