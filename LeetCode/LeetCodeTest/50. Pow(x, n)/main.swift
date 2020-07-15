//
//  main.swift
//  50. Pow(x, n)
//
//  Created by zainguo on 2020/5/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var n = n
        var res = 1.0
        var x = x
        
        if n < 0 {
            n = -n
            x = 1/x
        }
        
        while n > 1 {
            if n % 2 == 1 {
                res = res * x
            }
            x *= x
            n /= 2
        }
        return res * x
    }
}


let res = Solution().myPow(2.0, 4)
print(res)

