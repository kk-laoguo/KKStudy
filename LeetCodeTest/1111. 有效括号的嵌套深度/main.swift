//
//  main.swift
//  1111. 有效括号的嵌套深度
//
//  Created by zainguo on 2020/4/1.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    // "(()())"
    // [0,1,1,1,1,0]
    // "()(())()"
    // [0,0,0,1,1,0,1,1]
    // [1,1,1,0,0,1,1,1]
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        
        if seq.count == 0 {
            return []
        }
        var arr = [Character]()
        let arrSeq = [Character](seq)
        var res = [Int](repeating: 0, count: seq.count)
        for i in 0..<arrSeq.count {
            
            let c = arrSeq[i]
            if c == "(" {
                res[i] = arr.count % 2
                arr.append(c)
            } else {
                arr.removeFirst()
                res[i] = arr.count % 2
            }
        }
        return res
     
    }
}

let res = Solution().maxDepthAfterSplit("(()())")
print(res)

