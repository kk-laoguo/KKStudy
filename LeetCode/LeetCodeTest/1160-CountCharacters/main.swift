//
//  main.swift
//  1160-CountCharacters
//
//  Created by zainguo on 2020/3/17.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        
//        if words.count == 0 || chars.count == 0 {
//            return 0
//        }
//        var charMap = [Character: Int]()
//        for c in chars {
//            charMap[c] = (charMap[c] ?? 0) + 1
//        }
//        var res = 0
//        for str in words {
//            var isMatched = false
//            var tempMap = charMap
//            for c in str {
//
//                if let n =  tempMap[c]! {
//                    if n > 0 {
//                        tempMap[c]! -= 1
//                        isMatched = true
//                    } else {
//                        break
//                    }
//                }
//
//            }
//            if isMatched {
//                res += str.count
//            }
//        }
//        return res
        if words.isEmpty || chars.count == 0 {
            return 0
        }
        var charMap = [Character : Int]()
        for c in chars {
            charMap[c] = (charMap[c] ?? 0) + 1
        }
        var res = 0

        for str in words {
            var tempMap = charMap
            var matched = true

            for c in str {
                if let n = charMap[c] {
                    if n > 0 {
                        tempMap[c]! -= 1
                    } else {
                        matched = false
                        break
                    }
                } else {
                    matched = false
                    break
                }
            }
            if matched {
                res += str.count
            }

        }
        return res
    }
}
let res = Solution().countCharacters(["cat","bt","hat","tree"], "atach")
print(res)

