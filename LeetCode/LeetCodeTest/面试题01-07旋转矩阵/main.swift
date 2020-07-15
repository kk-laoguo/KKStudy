//
//  main.swift
//  面试题01-07旋转矩阵
//
//  Created by zainguo on 2020/4/7.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var arr = Array(matrix)
        for i in 0..<n {
            for j in 0..<n {
                arr[i][n - j - 1] = matrix[i][j]
            }
            
        }
        matrix = arr
//        matrix_new[j][n - i - 1] = matrix[i][j];

        
        
//        let row = matrix.count
//        // 水平翻转
//        for i in 0..<row {
//            for j in 0..<Int(row/2) {
//                (matrix[j][i], matrix[row - j - 1][i]) = (matrix[row - j - 1][i], matrix[j][i])
//            }
//        }
//        // 主对角线翻转
//        for i in 0..<row {
//            for j in 0..<i {
//                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
//            }
//        }
    }
}

var res = [[1,2,3],[4,5,6],[7,8,9]]
Solution().rotate(&res)
print(res)
