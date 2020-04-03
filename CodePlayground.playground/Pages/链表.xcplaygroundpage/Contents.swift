//: [Previous](@previous)

import Foundation

/*
 数组样例：
     a = [1,2,7,8,9]
 
 数组的优点：
     查询快速
     要查询数组的第三个元素
     a[2] 很快就找到了7
 
     缺点：
     增删耗时间
     如果我要在2和7之间增添一个5
     那么我需要将后面的7，8，9都向后移动一位
     因为数组的元素是连续存放的
 */

//链表刚好相反，它查询耗费时间，但是添加删除却是非常快的。

// 定义节点
class Node {

    var value: Int!
    var previous: Node?
    var next: Node?
}
// 定义链表
class Link {
    private var top: Node?
    private var current: Node?
    func getCount() -> Int {
        if top == nil {
            return 0
        }
        var count = 1
        var item = top
        while item!.next != nil {
            count += 1
            item = item?.next
        }
        return count
    }
    
    func append(_ value: Int) {
        if top == nil {
            top = Node()
            top?.value = value
            current = top
        } else {
            let node = Node()
            node.value = value
            current?.next = node
            node.previous = current
            current = node
        }
    }
    func delete(_ index: Int) {
        let count = getCount()
        if index >= count {
            return
        }
        if count == 0 {
            top = nil
            current = nil
            return
        }
        var item = top
        for _ in 0..<index {
            item = item?.next
        }
        item?.previous?.next = item?.next
        item?.next?.previous = item?.previous
    
        if current === item {
            current = item?.previous
        }
        if top === item {
            top = item?.next
        }
    }
    func show() {
        var node = top
        while node != nil {
            print(node?.value ?? "", terminator: "->")
            node = node?.next
        }
        print("\n")
    }
}

let link = Link()
link.append(2)
link.append(3)
link.append(5)
link.show()
link.append(7)
link.append(9)
link.show()
link.delete(2)
link.show()







//: [Next](@next)
