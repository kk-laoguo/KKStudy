//
//  main.swift
//  820. 单词的压缩编码
//
//  Created by zainguo on 2020/3/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

extension String {
        
    // 截取字符串: index 开始到结尾
    func subString(_ index: Int) -> String {
        let start = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[start..<endIndex])
    }
}

class Solution {
    
   
    func minimumLengthEncoding(_ words: [String]) -> Int {
        if words.isEmpty {
            return 0
        }
//        let sortArr = words.sorted { (str1, str2) -> Bool in
//            return str1.count > str2.count
//        }
//        var tempArr = [String](repeating: "", count: words.count)
//        for (i, value) in sortArr.enumerated() {
//            tempArr[i] = value + "#"
//        }
//
//        var res = String()
//
//        for value in tempArr {
//            if !res.contains(value) {
//                res = res + value
//            }
//        }
        //        return res.count

        var res = 0
        var wordSet = Set<String>(words)
        for str in wordSet {
            for i in 1..<str.count {
                wordSet.remove(str.subString(i))
            }
        }
        for str in wordSet {
            res += str.count + 1
        }
        
        return res
        
    }
}

let res = Solution().minimumLengthEncoding(["time", "me", "bell", "atime"]
)
print(res)
