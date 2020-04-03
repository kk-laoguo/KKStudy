//
//  main.swift
//  994-OrangesRotting
//
//  Created by zainguo on 2020/3/4.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return -1
        }
        // 行
        let m = grid.count
        // 列
        let n = grid[0].count
        // 新鲜水果
        var fresh = 0
        var queue: [[Int]] = [[Int]]()
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    fresh += 1;
                } else if (grid[i][j] == 2) {
                    queue.append([i, j])
                }
            }
        }
        if fresh == 0 {
            return 0
        }
        var origins = grid
        // 记录橘子上下左右
        let dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        var minutes = 0
        while !queue.isEmpty && fresh > 0 {
            var size = queue.count
            while size > 0 {
                let x = queue[0][0]
                let y = queue[0][1]
                queue.removeFirst()
                for i in 0..<4 {
                    let dx = x + dirs[i][0]
                    let dy = y + dirs[i][1]
                    if dx < 0 || dx >= m || dy < 0 || dy >= n || origins[dx][dy] != 1 {
                        continue
                    }
                    fresh -= 1
                    origins[dx][dy] = 2
                    queue.append([dx, dy])
                }
                size -= 1
            }
            minutes += 1
        }
        return fresh > 0 ? -1:minutes
    }
}


let res = Solution().orangesRotting([[2],[1]])

print(res)
