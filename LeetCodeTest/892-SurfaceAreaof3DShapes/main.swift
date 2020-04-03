//
//  main.swift
//  892-SurfaceAreaof3DShapes
//
//  Created by zainguo on 2020/3/25.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        
//        let count = grid.count
//        var nums = 0
//        var faces = 0
//        for i in 0..<count {
//            for j in 0..<i {
//                nums += grid[i][j]
//                if grid[i][j] > 0 {
//                    // 叠起来的 v 个立方体有 v-1 个接触面
//                    faces += grid[i][j] - 1
//                }
//                if i > 0 {
//                    // 当前柱子与上边柱子的接触面数量
//                    faces += min(grid[i - 1][j], grid[i][j])
//                }
//                if j > 0 {
//                    faces += min(grid[i][j - 1], grid[i][j])
//                }
//            }
//        }
//        return 6 * nums - 2 * faces
         let count = grid.count
         var nums = 0
         var faces = 0
         for i in 0..<count {
             for j in 0..<count {
                 nums += grid[i][j]
                 if grid[i][j] > 0 {
                     faces += grid[i][j] - 1
                 }
                 if i > 0 {
                     faces += min(grid[i - 1][j], grid[i][j])
                 }
                 if j > 0 {
                     faces += min(grid[i][j - 1], grid[i][j])
                 }
             }
         }
         return 6 * nums - faces * 2
    }
}

let res = Solution().surfaceArea([[1,2],[3,4]])
print(res)

