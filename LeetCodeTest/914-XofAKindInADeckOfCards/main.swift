//
//  main.swift
//  914-XofAKindInADeckOfCards
//
//  Created by zainguo on 2020/3/27.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        
        let count = deck.count
        if count < 2 {
            return false
        }
        var items = [Int: Int]()

        for i in deck {
            if let num = items[i] {
                items[i]! = num + 1
            } else {
                items[i] = 1
            }
        }
        var arr = [Int]()
        for num in items.values {
            arr.append(num)
        }
        let temp = arr.first!
        for i in 1..<arr.count {
        
            if gcd(temp, arr[i]) == 1 {
                return false
            }
        }
        return true
    }
    func gcd(_ x: Int, _ y: Int) -> Int {
        return x % y == 0 ? y : gcd(y, x % y)
    }
    
}

let res = Solution().hasGroupsSizeX([1])
print(res)
