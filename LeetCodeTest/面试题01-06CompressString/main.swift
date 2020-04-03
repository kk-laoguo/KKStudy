//
//  main.swift
//  面试题01-06CompressString
//
//  Created by zainguo on 2020/3/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation



class Solution {
    func compressString(_ S: String) -> String {
        if S.count == 0 {
            return ""
        }
        var result: String = ""
        var times: Int = 0
        var lastStr: Character = S.first!
       
        for item in S {
            
            if lastStr == item {
                times += 1
            } else {
                
                result.append("\(lastStr)\(times)")

                lastStr = item
                times = 1
            }
        }
        result.append("\(lastStr)\(times)")
      
        return result
    }
}
let res = Solution().compressString("aabcccccaa")
print(res)

