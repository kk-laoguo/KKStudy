//
//  main.swift
//  990. 等式方程的可满足性
//
//  Created by zainguo on 2020/6/8.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        var parent = Array.init(repeating: 0, count: 26)
        for i in 0..<26 {
            parent[i] = i
        }
        for e in equations {
            let chars = Array(e)
            if chars[1] == "!" {
                continue
            }
            if chars[1] == "=" {
                union(&parent, Int(chars[0].asciiValue! - 97), Int(chars[3].asciiValue! - 97))
            }
        }
        for e in equations {
            let chars = Array(e)
            if chars[1] == "=" {
                continue
            }
            if chars[1] == "!" {
                let p1 = find(parent, Int(chars[0].asciiValue! - 97))
                let p2 = find(parent, Int(chars[3].asciiValue! - 97))
                if p1 == p2 {
                    return false
                }
            }
        }
        return true
    }
    func union(_ parent: inout [Int], _ a: Int, _ b: Int ) {
        let p1 = find(parent, a)
        let p2 = find(parent, b)
        parent[p1] = p2
    }
    func find(_ parent: [Int], _ a: Int) -> Int {
        var a = a
        var parent = parent
        while parent[a] != a {
            parent[a] = parent[parent[a]]
            a = parent[a]
        }
        return parent[a]
    }
}


let res = Solution().equationsPossible(["a==b","b!=a"])
print(res)

