//
//  main.swift
//  572. 另一个树的子树
//
//  Created by zainguo on 2020/5/7.
//  Copyright © 2020 zainguo. All rights reserved.
//


import Foundation
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
        
    }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}




class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        
        if s == nil && t == nil {
            return true
        }
        if s == nil || t == nil {
            return false
        }
        
        if isSameTree(s, t) {
            return true
        }
        return isSubtree(s?.left, t) || isSubtree(s?.right, t)
        
        
    }
    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if s == nil || t == nil {
            return false
        }
        return s?.val == t?.val && isSameTree(s?.left, t?.left) && isSameTree(s?.right, t?.right)
    }
    
}
