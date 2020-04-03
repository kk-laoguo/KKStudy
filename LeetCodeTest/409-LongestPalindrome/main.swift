//
//  main.swift
//  409-LongestPalindrome
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        guard s.count > 0 else {
            return 0
        }
        if s.count == 1 {
            return 1
        }
        var charDic = [Character: Int]()
        for char in s {
            if let count = charDic[char] {
                charDic[char]! = count + 1
            } else {
                charDic[char] = 1
            }
        }
       
        
        var longCount = 0
        var singleCount = 0
        for key in charDic.keys {
            if charDic[key]! % 2 != 0 {
                singleCount = 1

            }
            print(charDic[key]! / 2 * 2)
            longCount += charDic[key]! / 2 * 2
        }
        longCount += singleCount
       
        return longCount
    }
}



let res = Solution().longestPalindrome("abccccdd")
print(res)
