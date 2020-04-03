//
//  main.swift
//  面试题62. 圆圈中最后剩下的数字
//
//  Created by zainguo on 2020/3/30.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

// [约瑟夫环——公式法（递推公式）](https://blog.csdn.net/u011500062/article/details/72855826)

class Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        
        var res = 0
        for i in 2...n {
            res = (res + m) % i
        }
        return res 
        
    }
    
}


let res = Solution().lastRemaining(5, 3)
print(res)
