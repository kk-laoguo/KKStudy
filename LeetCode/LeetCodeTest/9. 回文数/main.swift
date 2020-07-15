//
//  main.swift
//  9. 回文数
//
//  Created by zainguo on 2020/6/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        /*
        121
        121
        1111
        */
        if x == 0 {
            return true
        }
        if x < 0 || x % 10 == 0 {
            return false
        }
        var res = 0
        var num = x
        while res < num {
            res = res * 10 + num % 10
            num = num / 10
        }
        return res == num  || (num == res/10)
    }

}

let res = Solution().isPalindrome(121)
print(res)

