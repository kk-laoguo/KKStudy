//
//  main.swift
//  10-01-MergeArray
//
//  Created by zainguo on 2020/3/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {
       
        var res = [Int]()
        
        for(index, value) in A.enumerated() {
            if index > m - 1  {
                res.append(contentsOf: B)
                break
            }
            res.append(value)
        }
     
        A = res
        A.sort { return $0 < $1 }
        print(A)
    }
    // 双指针解法
    func merge2(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {
        
        var a = m - 1
        var b = n - 1
        //
        var cur = m + n - 1
        while  a >= 0 && b >= 0 {
            if A[a] < B[b] {
                A[cur] = B[b]
                cur -= 1
                b -= 1
            } else {
                A[cur] = A[a]
                cur -= 1
                a -= 1
            }
        }
        if b != -1 {
            for i in 0...b {
                A[i] = B[i]
            }
        }
        print(A)
    }
    
}
var arr = [1,2,3,0,0,0]
Solution().merge2(&arr, 3, [2,5,6], 3)






