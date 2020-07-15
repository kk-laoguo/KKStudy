//
//  main.swift
//  56. 合并区间
//
//  Created by zainguo on 2020/4/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        if intervals.count == 0 {
            return []
        }

        let sortedArr = intervals.sorted { $0.first! < $1.first! }
        
        var res = [[Int]]()
        var last = sortedArr[0]
        for item in sortedArr[1...] {
            if last[1] >= item[0] {
                last[1] = max(last[1], item[1])
            } else {
                res.append(last)
                last = item
            }
        }
        
        res.append(last)
        return res


        
    }
}

let res = Solution().merge([[1,4],[4,5]])
print(res)
