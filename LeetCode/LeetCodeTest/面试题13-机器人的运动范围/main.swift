//
//  main.swift
//  面试题13-机器人的运动范围
//
//  Created by zainguo on 2020/4/8.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if m == 0||n == 0 {
            return 0
        }
        
        let directions = [[1, 0], [-1, 0], [0, 1], [0 , -1]]
        var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var queue = [[Int]]()
        queue.append([0, 0])
        visited[0][0] = 1
        var res = 1
        while queue.count > 0 {
            let cur = queue.removeLast()
            for i in 0..<4 {
                let x = cur[0] + directions[i][0]
                let y = cur[1] + directions[i][1]
                if x >= m || x < 0 || y >= n || y < 0 || visited[x][y] == 1 {
                    continue
                }
                let value = sum(x) + sum(y)
                if value > k {
                    continue
                }
                visited[x][y] = 1
                queue.append([x, y])
                res += 1
            }
        }
        return res
        
    }
    func sum(_ num: Int) -> Int {
        var res = 0
        var temp = num
        while temp > 0 {
            res += temp % 10
            temp = temp / 10
        }
        return res
    }
    
}
// 0 0 0
// 0 0 0

let res = Solution().movingCount(2, 3, 1)
print(res)
    
