//
//  main.swift
//  1371. 每个元音包含偶数次的最长子字符串
//
//  Created by zainguo on 2020/5/20.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

/*
 class Solution {
     public int findTheLongestSubstring(String s) {
         //收集状态码第一次出现时的index
         Map<Integer,Integer> map = new HashMap<>();
         int max = 0;
         //需要维护的状态码变量
         int status = 0;
         
         //将-1置为第一次出现0状态码的index
         map.put(0, -1);

         for(int i = 0;i < s.length();i++){
             char now = s.charAt(i);
             
             if(now == 'a') {
                 //00001
                 status = status ^ (1 << 0);
                 
                 map.putIfAbsent(status, i);
             }else if(now == 'e') {
                 //00010
                 status = status ^ (1 << 1);
                 
                 map.putIfAbsent(status, i);
             }else if(now == 'i') {
                 //00100
                 status = status ^ (1 << 2);
                 
                 map.putIfAbsent(status, i);
             }else if(now == 'o') {
                 //01000
                 status = status ^ (1 << 3);
                 
                 map.putIfAbsent(status, i);
             }else if(now == 'u') {
                 //10000
                 status = status ^ (1 << 4);
                 
                 map.putIfAbsent(status, i);
             }
             
             //如果此时，map中存在这个状态码，证明此时，除去第一个该状态码所在的index，可得出去除map.get(status)这个index后                   i - status所在index这段字符串中所有元音都为0或者为偶数个，那么进行取最大值判断max为多少
             if(map.containsKey(status)) max = Math.max(max, i - map.get(status));
         }
         
         return max;
     }
 }

 作者：myicecream
 链接：https://leetcode-cn.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/solution/javashi-xian-tong-guo-wei-yun-suan-huo-qu-zhuang-t/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var status = 0
        var maps = [Int: Int]()
        var res = 0
        maps[0] = 0

        for i in 0..<chars.count {
            switch chars[i] {
            case "a":
                status = status ^ (1 << 0)
                break
            case "e":
                status = status ^ (1 << 1)
                break
            case "i":
                status = status ^ (1 << 2)
                break
            case "o":
                status = status ^ (1 << 3)
                break
            case "u":
                status = status ^ (1 << 4)
                break
            default:
                break
            }
            if let v = maps[status] {
                res = max(res, i - v + 1)
            } else {
                maps[status] =  i + 1
            }
        }
        return res
        
        /*
          let chars = Array(s)
                var status:Int8 = 0
                var maps = [Int8:Int]()
                
                guard chars.count > 0 else {
                    return 0
                }
                
                var result = 0
                maps[0] = 0
                for i in 0...chars.count - 1 {
                    switch chars[i] {
                        case "a":
                            status ^= (1 << 0)
                            break
                        case "e":
                            status ^= (1 << 1)
                            break
                        case "i":
                            status ^= (1 << 2)
                            break
                        case "o":
                            status ^= (1 << 3)
                            break
                        case "u":
                            status ^= (1 << 4)
                            break
                        default:
                            break
                    }
                    if let first = maps[status] {
                        result = max(result, i + 1 - first)
                    } else {
                        maps[status] = i + 1
                    }
                }
                
                return result
        链接：https://leetcode-cn.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/solution/qian-zhui-he-zhuang-tai-ya-suo-100-by-redanlua/
        来源：力扣（LeetCode）
        著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
    }
}

let res = Solution().findTheLongestSubstring("eleetminicoworoep")
print(res)
