//
//  main.swift
//  面试题64. 求1+2+…+n
//
//  Created by zainguo on 2020/6/2.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func sumNums(_ n: Int) -> Int {
        return n == 0 ? 0: n + sumNums(n - 1)
    }
}
let res = Solution().sumNums(3)
print(res)

