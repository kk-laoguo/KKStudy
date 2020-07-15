//
//  main.swift
//  22- 括号生成
//
//  Created by zainguo on 2020/4/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        dfs(&res, n, 0, 0, "")
        return res
    }
    func dfs(_ res: inout [String], _ n: Int, _ left: Int, _ right: Int, _ cur: String) {
        
        if left == n && right == n {
            res.append(cur)
            return
        }
        if left > right && left <= n {
            dfs(&res, n, left, right + 1, cur + ")")
        }
        if left < n {
            dfs(&res, n, left + 1, right, cur + "(")
        }
    }
}

let res = Solution().generateParenthesis(3)
print(res)



