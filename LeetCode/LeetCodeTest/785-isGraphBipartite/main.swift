//
//  main.swift
//  785-isGraphBipartite
//
//  Created by zainguo on 2020/1/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        // graph : [[1,3], [0,2], [1,3], [0,2]]
        // 可以看成 0 的相邻节点为1, 3
        // 1 的相邻节点为0, 2
        // 2 的相邻节点为1, 3
        // 的无向图

        let num = graph.count
        // 相邻节点的颜色
        // 0: 默认 1: 红色 2: 绿色
        var visited = [Int](repeating: 0, count: num)
        for i in 0..<num {
            if visited[i] != 0 {
                continue
            }
            var queue = [Int]()
            queue.append(i)
            // 标记当前为红色
            visited[i] = 1
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let curColor = visited[cur]
                let neighborColor = curColor == 1 ? 2:1
                for (_ , neignbor) in graph[cur].enumerated() {
                    if visited[neignbor] == 0 { // 没涂色
                        visited[neignbor] = neighborColor
                        queue.append(neignbor)
                    } else if (visited[neignbor] != neighborColor) {
                        // 当前节点和相邻的节点涂色相同
                        return false
                    }
                }
                
            }
        }
        return true
    }
}

