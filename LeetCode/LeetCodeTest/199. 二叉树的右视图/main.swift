//
//  main.swift
//  199. 二叉树的右视图
//
//  Created by zainguo on 2020/4/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard var cur = root else {
            return res
        }
        var queue = [cur]
        while !queue.isEmpty {
            cur = queue.removeFirst()
            for i in 0..<count {
                
                cur = queue.removeFirst()
                if let leftNode = cur.left {
                    queue.append(leftNode)
                }
                if let rightNode = cur.right {
                    queue.append(rightNode)
                }
                if i == count - 1 {
                    res.append(cur.val)
                }
            }
        }
        return res
    }
}

//let res = Solution().rightSideView([1,2,3,NSNull ,5, NSNull,4])
//print(res)

