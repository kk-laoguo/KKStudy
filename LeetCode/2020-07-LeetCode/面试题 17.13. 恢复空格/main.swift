//
//  main.swift
//  面试题 17.13. 恢复空格
//
//  Created by zainguo on 2020/7/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

extension String {

    subscript (r: Range<Int>) -> String {
         get {
             let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
             let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
             return String(self[startIndex..<endIndex])
         }
     }
    
}

class Solution {
    func respace(_ dictionary: [String], _ sentence: String) -> Int {
        let n = sentence.count
        if n == 0 {
            return 0
        }
        let m = dictionary.count
        // dp[i]表示sentence中的前i个字符组成的字符串中最大识别数。
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            dp[i] = dp[i - 1]
            for j in 0..<m {
                if i < dictionary[j].count {
                    continue
                }
                let a = i - dictionary[j].count
                if sentence[a..<i] == dictionary[j] {
                    dp[i] = max(dp[i - dictionary[j].count] + dictionary[j].count , dp[i])
                }
            }
        }
        return n - dp[n]
    }
}

let res = Solution().respace(["looked","just","like","her","brother"]
, "")
print(res)
