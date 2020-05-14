//
//  main.swift
//  23. 合并K个排序链表
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        return merge(lists, 0, lists.count - 1)
    }
    func merge(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return lists[left]
        }
        let mid = left + (right - left) / 2
        let leftNodes = merge(lists, left, mid)
        let rightNodes = merge(lists, mid + 1, right)

        
        return mergeTwoLists(leftNodes, rightNodes)
       
        
    }
    func mergeTwoLists(_ leftNodes: ListNode?, _ rightNodes: ListNode?) -> ListNode? {
        
        
        if leftNodes == nil {
            return rightNodes
        }
        if rightNodes == nil  {
            return leftNodes
        }
      
        if leftNodes!.val < rightNodes!.val {
            leftNodes?.next = mergeTwoLists(leftNodes?.next, rightNodes)
            return leftNodes

        } else {
            rightNodes?.next = mergeTwoLists(leftNodes, rightNodes?.next)
            return rightNodes
        }
    }
    
    
}

//let res = Solution().mergeKLists([[1,4,5],[1,3,4],[2,6]])

