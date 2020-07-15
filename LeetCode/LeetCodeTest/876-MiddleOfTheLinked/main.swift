//
//  main.swift
//  876-MiddleOfTheLinked
//
//  Created by zainguo on 2020/3/23.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
   
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        var fastNode = head
        var slowNode = head
        while fastNode != nil && slowNode?.next != nil  {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        return slowNode
    }
}

