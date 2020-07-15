//
//  main.swift
//  面试题 16.11. 跳水板
//
//  Created by zainguo on 2020/7/8.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        if k == 0 {
            return []
        }
        if shorter == longer {
            return [shorter * k]
        }
        
        var res = [Int](repeating: 0, count: k + 1)
        
        for i in 0...k {
            res[i] = shorter * (k - i) + longer * i
        }
        return res
    }
}

