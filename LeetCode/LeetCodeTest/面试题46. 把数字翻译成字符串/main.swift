//
//  main.swift
//  面试题46. 把数字翻译成字符串
//
//  Created by zainguo on 2020/6/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func translateNum(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        let arr = Array("\(num)")
        var cur = 1
        var prev = 1
        for i in 1..<arr.count {
            let temp = Int("\(arr[i-1])\(arr[i])")!
            if temp >= 10 && temp<=25 {
                let temnum = cur
                cur = cur + prev
                prev = temnum
                
            } else {
                prev = cur
            }
        }
        return cur

    }
}
//class Solution {
//    public int translateNum(int num) {
//        String s = String.valueOf(num);
//        int a = 1, b = 1;
//        for(int i = 2; i <= s.length(); i++) {
//            String tmp = s.substring(i - 2, i);
//            int c = tmp.compareTo("10") >= 0 && tmp.compareTo("25") <= 0 ? a + b : a;
//            b = a;
//            a = c;
//        }
//        return a;
//    }
//}
//class Solution {
//    func translateNum(_ num: Int) -> Int {
//        if num < 10 {return 1}
//        let remainder = num % 100
//        if remainder <= 9 || remainder >= 26 {
//            return translateNum(num / 10)
//        } else {
//            return translateNum(num / 10) + translateNum(num / 100)
//        }
//    }
//}



let res = Solution().translateNum(12258)
print(res)
