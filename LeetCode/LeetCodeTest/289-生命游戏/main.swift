//
//  main.swift
//  289-生命游戏
//
//  Created by zainguo on 2020/4/2.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


/*
 如果活细胞周围八个位置的活细胞数少于两个，则该位置活细胞死亡；
 如果活细胞周围八个位置有两个或三个活细胞，则该位置活细胞仍然存活；
 如果活细胞周围八个位置有超过三个活细胞，则该位置活细胞死亡；
 如果死细胞周围正好有三个活细胞，则该位置死细胞复活；

 */
class Solution {
    static let directions: [[Int]] = [[0, 1], [0, -1], [1, 0], [-1, 0], [-1, -1], [1, -1],[-1, 1],[1, 1]]
    func gameOfLife(_ board: inout [[Int]]) {
        if board.count == 0 {
            return
        }
       
        /*
         live < 2 || > 3 -> die 2
         live  >2 || == 3 不变
         die == 3 -> live -1
         update => 2 -> 0, -1 -> 1
         */
        let row = board.count
        let col = board[0].count
        for i in 0..<row {
            for j in 0..<col {
                // 死的
                if board[i][j] == 0  {
                    let lives = count(board, i, j)
                    if lives == 3 {
                        board[i][j] = -1
                    }
                }
                if board[i][j] == 1 {
                    let lives = count(board, i, j)
                    if lives < 2 || lives > 3 {
                        board[i][j] = 2
                    }

                }
            }
        }
        update(&board)
        
    }
   
    func count(_ board: [[Int]], _ row: Int, _ col: Int) -> Int {
        var res = 0
        for i in 0..<8 {
            let new_row = row + Solution.directions[i][0]
            let new_col = col + Solution.directions[i][1]
            if new_row >= 0 && new_row < board.count && new_col >= 0 && new_col < board[0].count && (board[new_row][new_col] == 1 || board[new_row][new_col] == 2) {
                res += 1
            }
        }
        return res
        
    }
    func update(_ board: inout [[Int]]) {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == -1 {
                    board[i][j] = 1
                }
                if board[i][j] == 2 {
                    board[i][j] = 0
                }
            }
        }
    }
}

var res = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]

Solution().gameOfLife(&res)
print(res)

