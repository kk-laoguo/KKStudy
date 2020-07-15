//
//  main.swift
//  14. 最长公共前缀
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

extension String {
        
    // 截取字符串: index 开始到结尾
    func yx_subString(_ index: Int) -> String {
        let start = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[start..<endIndex])
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var res = strs[0];
        for i in 1..<strs.count {
            while strs[i].hasPrefix(res) == false {
                // before 指定位置之前的一位
                let endIndex = res.index(before: res.endIndex)
                res = String(res[..<endIndex])
//                res = res.substring(to: res.index(before: res.endIndex))
                if res.isEmpty {
                    return ""
                }
            }
        }
        return res
    }
}
let res = Solution().longestCommonPrefix(["flower","flow","flight"])
print(res)


//class Solution {
//    public String longestCommonPrefix(String[] strs) {
//        if(strs.length == 0)
//            return "";
//        String ans = strs[0];
//        for(int i =1;i<strs.length;i++) {
//            int j=0;
//            for(;j<ans.length() && j < strs[i].length();j++) {
//                if(ans.charAt(j) != strs[i].charAt(j))
//                    break;
//            }
//            ans = ans.substring(0, j);
//            if(ans.equals(""))
//                return ans;
//        }
//        return ans;
//    }
//}
