//
//  main.swift
//  面试题29. 顺时针打印矩阵
//
//  Created by zainguo on 2020/6/6.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let row = matrix.count
        let col = matrix[0].count
        let sum = row * col
        var res: [Int] = Array(repeating: 0, count: sum)
        var left = 0
        var top = 0
        var right = col - 1
        var bottom = row - 1
        var n = -1
        while true {
            for i in left...right {
                n += 1
                res[n] = matrix[top][i]
            }
            top += 1
            if top > bottom {
                break
            }
            for i in top...bottom {
                n += 1
                res[n] = matrix[i][right]
            }
            right -= 1
            if left > right {
                break
            }
            for i in (left...right).reversed() {
                n += 1
                res[n] = matrix[bottom][i]
            }
            bottom -= 1
            if top > bottom {
                break
            }
            for i in (top...bottom).reversed() {
                n += 1
                res[n] = matrix[i][left]
            }
            left += 1
            if left > right {
                break
            }
        }
        return res
    }
}
let res = Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
print(res)
