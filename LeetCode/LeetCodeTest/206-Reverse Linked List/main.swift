//
//  main.swift
//  206-Reverse Linked List
//
//  Created by zainguo on 2020/3/2.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class ListNode {
    public var val: Int = 0
    public var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseLisit(_ head: ListNode?) -> ListNode? {
        
        if head == nil {
            return nil
        }
        
        var cur: ListNode? = head
        var next: ListNode?
        var pre: ListNode?
        
        while cur?.next != nil {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
       
    }
}

