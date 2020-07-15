//
//  main.swift
//  125. 验证回文串
//
//  Created by zainguo on 2020/6/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        
        var chars = [Character]()
        for c in s.lowercased() {
            if (c >= "0" && c <= "9") || (c >= "a" && c <= "z") {
                chars.append(c)
            }
        }
        var right = chars.count - 1
        var left = 0
        
        while left <= right {
            if chars[left] != chars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
