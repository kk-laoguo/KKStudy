//
//  main.swift
//  841-KeysAndRooms
//
//  Created by zainguo on 2020/1/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Solution {
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = [Int]()
        dfs(rooms, 0, &visited)
        return visited.count == rooms.count
    }
    func dfs(_ graph: [[Int]], _ cur: Int, _ visited: inout [Int]) {
       
        if visited.contains(cur) {
            return
        }
        visited.append(cur)
        for(_, next) in graph[cur].enumerated() {
            dfs(graph, next, &visited)
        }
    }
}
let res = Solution().canVisitAllRooms([[1],[2],[3],[]])
print(res)
