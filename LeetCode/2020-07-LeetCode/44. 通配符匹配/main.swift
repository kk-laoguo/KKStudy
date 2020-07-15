//
//  main.swift
//  44. 通配符匹配
//
//  Created by zainguo on 2020/7/5.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // 上下两个指针
        var i = 0, j = 0
        // *的位置
        var start = -1
        // 匹配*用的
        var match = -1
        let char_s = Array(s)
        let char_p = Array(p)
        
        while i < s.count {
            // 当前两个字符串是否相同
            if j < p.count && (char_s[i] == char_p[j] || char_p[j] == "?") {
                i += 1
                j += 1
            } else if (j < p.count && char_p[j] == "*") {
                //匹配到*号
                start = j
                // s字符串中开始匹配
                match = i
                // p中是*, 跳过*到下一个字符串
                j = start + 1
                
            } else if (start != -1) {
                // *没有匹配成功
                match += 1
                i = match
                // 仍然表示*的下一个字符
                j = start + 1
                
            } else {
                return false
            }
        }
        // abcd
        // a*d*
        // 消除最后一个*
        while j < p.count && char_p[j] == "*" {
            j += 1
        }
        return j == p.count
        
    }
}
let res = Solution().isMatch("aa", "*")
print(res)
