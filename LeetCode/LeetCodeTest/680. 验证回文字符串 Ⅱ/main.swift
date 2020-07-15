//
//  main.swift
//  680. 验证回文字符串 Ⅱ
//
//  Created by zainguo on 2020/5/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func validPalindrome(_ s: String) -> Bool {
        var i = 0, j = s.count - 1
        let chars = Array(s)
        while(i < j) {
            if chars[i] != chars[j] {
                return validSubPalindrome(chars, i + 1, j) || validSubPalindrome(chars, i, j - 1)
            }
            i += 1
            j -= 1
        }
        return true
    }
    func validSubPalindrome(_ s: [Character], _ i: Int, _ j: Int) -> Bool {
        var i = i, j = j
        while (i < j) {
            if s[i] != s[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}

let res = Solution().validPalindrome("abca")
print(res)

