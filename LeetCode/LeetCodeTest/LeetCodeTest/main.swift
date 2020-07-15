//
//  main.swift
//  LeetCodeTest
//
//  Created by zainguo on 2020/1/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func findOrder(_ numsCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [Int](), count: numsCourses)
        for p in prerequisites {
            // p[1]先修的课,p[0]后修的课
            graph[p[1]].append(p[0])
        }
        // 0: 未访问 1: 正在访问 2: 已经访问过
        // 状态数组
        var status = [Int](repeating: 0, count: numsCourses)
        var res = [Int]()
        for i in 0..<numsCourses {
            if dfs(cur: i, graph: graph, status: &status, res: &res) {
                // 有环
                return []
            }
        }
        return res.reversed()
        
    }
    func dfs(cur: Int, graph: [[Int]], status: inout [Int], res: inout [Int]) -> Bool {
        if status[cur] == 1 {
            // 上次访问过, 这次又重新访问表示 有环 无解
            return true
        }
        if status[cur] == 2 {
            // 已经访问过, 无需再次访问
            return false
        }
        status[cur] = 1
        for (_, item) in graph[cur].enumerated() {
            if dfs(cur: item, graph: graph, status: &status, res: &res) {
                return true
            }
        }
        // 标记为已经访问状态
        status[cur] = 2
        res.append(cur)
        return false
    }
    
//    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//
//        var gra
//    }
}


let s = Solution().findOrder(4, [[1,0],[2,0],[3,1],[3,2]])
print(s)



