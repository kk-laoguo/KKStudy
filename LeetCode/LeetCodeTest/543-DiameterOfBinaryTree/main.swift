//
//  main.swift
//  543-DiameterOfBinaryTree
//
//  Created by zainguo on 2020/3/10.
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
    var ans = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        _ = dfs(root)
        return ans
    }
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let h_left = dfs(root?.left)
        let h_right = dfs(root?.right)
        ans = max(ans,  h_left + h_right)
        return max(h_right, h_left) + 1
    }
}
