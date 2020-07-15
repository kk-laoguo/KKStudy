//
//  main.swift
//  8-字符串转换整数
//
//  Created by zainguo on 2020/4/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
/*
 如果第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字字符组合起来，形成一个有符号整数。
 假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成一个整数。
 该字符串在有效的整数部分之后也可能会存在多余的字符，那么这些字符可以被忽略，它们对函数不应该造成影响。
 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换，即无法进行有效转换。
 在任何情况下，若函数不能进行有效的转换时，请返回 0 。
 */

class Solution {
    func myAtoi(_ str: String) -> Int {
       
        let arr = Array(str)
        var index = 0
        while index < arr.count && arr[index] == " " {
            index += 1
        }
        if index == arr.count {
            // 去掉空格以后到了末尾了
            return 0
        }
        // 表示是否是负数: -1 正数: 1
        var isNegative = 1
        
        let c = arr[index]
        
        if c == "-" {
            isNegative = -1
            index += 1
            
        } else if c == "+" {
            index += 1
        } else if !coverInt(c) {
            // 不是数字
            return 0
        }
        var res = 0
        while index < arr.count && coverInt(arr[index]) {
            let num = Int(String(arr[index]))!
            res = res * 10 + num
            if isNegative == 1 && res > Int32.max {
                return Int(Int32.max)
            }
            if isNegative == -1 && -res < Int32.min {
                return Int(Int32.min)
            }
            index += 1
        }
        
        return res * isNegative
    }
    func coverInt(_ str: Character) -> Bool {
        switch str {
        case "0"..."9":
            return true
        default:
            return false
        }
    }
}


let res = Solution().myAtoi("-420000 uuuu")
print(res)
