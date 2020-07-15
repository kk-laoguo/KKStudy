//
//  main.swift
//  151-翻转字符串里的单词
//
//  Created by zainguo on 2020/4/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func _reverse<T>(_ chars: inout [T], _ start: Int, _ end: Int) {
        var start = start, end = end
        while start < end {
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    func swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
        (chars[p], chars[q]) = (chars[q], chars[p])
    }
    func reverseWords(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
//        let str = s.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//        let arr = str.components(separatedBy: " ")
//        var res: String = ""
//        for str in arr.enumerated().reversed() {
//            if str.element == "" {
//                continue
//            }
//            res += str.element
//            if str.offset != 0 {
//                res += " "
//            }
//        }
//        return res
        
        var chars = Array(s), start = 0
        _reverse(&chars, start, chars.count - 1)
        for i in 0..<chars.count {
            if i == chars.count - 1 || chars[i + 1] == " " {
                _reverse(&chars, start, i)
                start = i + 2
            }
        }
        return String(chars)
    }
}


let res = Solution().reverseWords("a good   example")

print(res)
