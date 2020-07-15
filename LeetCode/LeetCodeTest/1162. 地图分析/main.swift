//
//  main.swift
//  1162. 地图分析
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return -1
        }
        let row = grid.count
        let col = grid[0].count
        var queue = [[Int]]()

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 1 {
                    // 将所有陆地都放入队列中
                    queue.append([i, j])
                }
            }
        }
        // 没有陆地或者都是陆地
        
        if queue.count == 0 || queue.count == row * col {
            return -1
        }
        var distance = -1
        // 记录移动的方向
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        
        var arr = grid
        while queue.count > 0 {
            distance += 1
            var size = queue.count
            while size > 0 {
                let x = queue[0][0]
                let y = queue[0][1]
                queue.removeFirst()
                for i in 0..<4 {
                    let mx = x + directions[i][0]
                    let my = y + directions[i][1]
                    if mx < 0 || mx >= row || my < 0 || my >= col || arr[mx][my] != 0 {
                        continue
                    }
                    // 把grid中搜索过的元素设置为2
                    arr[mx][my] = 2
                    queue.append([mx, my])
                }
                size -= 1
            }
        }
        return distance
    }
}

let res = Solution().maxDistance([[1,0,0],[0,0,0],[0,0,0]])
print(res)
