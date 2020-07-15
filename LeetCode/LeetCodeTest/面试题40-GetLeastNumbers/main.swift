//
//  main.swift
//  面试题40-GetLeastNumbers
//
//  Created by zainguo on 2020/3/20.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        
        let sortedArr = arr.sorted(by:<)
        var res = [Int]()
        for i in 0..<k {
            res.append(sortedArr[i])
        }
        return res
    }
}
