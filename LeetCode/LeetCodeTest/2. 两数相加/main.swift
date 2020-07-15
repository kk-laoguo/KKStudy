//
//  main.swift
//  2. 两数相加
//
//  Created by zainguo on 2020/6/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        var l1 = l1, l2 = l2, result = ListNode(0)
        var head = result
        var addOne = 0
        while l1 != nil || l2 != nil || addOne != 0 {
            let val1 = l1 == nil ? 0:l1!.val
            let val2 = l2 == nil ? 0:l2!.val
            let sum = val1 + val2 + addOne
            head.next = ListNode(sum % 10)
            head = head.next!
            addOne = sum / 10
            if l1 != nil {
                l1 = l1!.next
            }
            if l2 != nil {
                l2 = l2!.next
            }
        }
        return result.next
    }
}
//class Solution {
//    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
//
//     ListNode dummy = new ListNode(0);
//        ListNode head = dummy;
//        int addOne = 0;
//        while(l1 != null || l2 != null || addOne != 0){
//            int val1 = l1 == null ? 0:l1.val;
//            int val2 = l2 == null ? 0:l2.val;
//            int sum = val1 + val2 + addOne;
//            head.next = new ListNode(sum % 10);
//            head = head.next;
//            addOne = sum/10;
//            if(l1 != null) l1 = l1.next;
//            if(l2 != null) l2 = l2.next;
//        }
//        return dummy.next;
//
//    }
//}
