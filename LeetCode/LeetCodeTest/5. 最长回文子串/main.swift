//
//  main.swift
//  5. 最长回文子串
//
//  Created by zainguo on 2020/5/21.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
//        var res = ""
//        var max = 0
//        for i in 0..<s.count {
//            var j = i
//            while j<s.count {
//                let index1 = s.index(s.startIndex, offsetBy: i)
//                let index2 = s.index(s.startIndex, offsetBy: j)
//                let str = String(s[index1...index2])
//                if validPalindrome(str) && str.count > max {
//                    res = str
//                    max = str.count
//                }
//                j += 1
//            }
//        }
//        return res
        
        var len = 0
        var start = 0
        for i in 0..<s.count {
            let cur = max(getLen(s, i, i), getLen(s, i, i + 1))
            if cur > len {
                len = cur
                start = i - (cur - 1)/2
            }
        }
        
        let index1 = s.index(s.startIndex, offsetBy: start)
        let index2 = s.index(index1, offsetBy: len)
        let str = String(s[index1..<index2])
        return str
    }
    func getLen(_ s: String, _ i: Int, _ j: Int) -> Int {
        let chars = Array(s)
        var i = i, j = j
        while i>=0 && j<s.count && chars[i] == chars[j] {
            i -= 1
            j += 1
        }
        return j - i - 1
    }
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        for i in 0..<s.count/2 {
            if chars[i] != chars[s.count - i - 1] {
                return false
            }
        }
        return true
    }
}
let res = Solution().longestPalindrome("babad")
print(res)
