//: [Previous](@previous)

import Foundation

// 栈和队列
// 区别: 队列先进先出 栈先进后出
//
class Node {
    var value: Int!
    var next: Node?
    var previous: Node?
}
class Stack {
    var current: Node?
    func push(_ value: Int) {
        let node = Node()
        node.value = value
        node.next = current
        current = node
    }
    func pop() -> Int? {
        let res = current?.value
        current = current?.next
        return res
    }
    func count() -> Int {
        var stack = current
        var count = 0
        while stack != nil {
            count += 1
            stack = stack?.next
        }
        return count
    }
    func show() {
        var stack = current
        while stack != nil {
            print(stack?.value ?? "", terminator: "->")
            stack = stack?.next
        }
        print("\n")
    }
}
let stack = Stack()
stack.push(20)
stack.push(24)
stack.push(30)
stack.show()

stack.push(33)
stack.push(40)
stack.show()
stack.pop()
stack.show()


class Link {
    private var top: Node?
    private var current: Node?
    func count() -> Int {
        if top == nil {
            return 0
        }
        var count = 1
        var item = top
        while item?.next != nil {
            count += 1
            item = item?.next
        }
        return count
    }
    func append(_ value: Int) {
        
        let node = Node()
        node.value = value

        if top == nil {
            top = node
            current = top
        } else {
            current?.next = node
            node.previous = current
            current = node
        }
    }
    func delete(index: Int) -> Int? {
        let n = count()
        if index >= n {
            return nil
        }
        if n == 1 {
            let res = top?.value
            top = nil
            current = nil
            return res
        }
        var item = top
        
        for _ in 0..<index {
            item = item?.next
        }
     
        item?.previous?.next = item?.next
        item?.next?.previous = item?.previous
        
        if current === item  {
            current = item!.previous
        }
        if top === item {
            top = item?.next
        }
        return item?.value ?? 0
    }
    func show() {
        var item = top
        while item != nil {
            print(item?.value ?? "", terminator: "->")
            item = item?.next
        }
        print("\n")
    }
}

class Queue {
    private let link = Link()
    func push(_ value: Int) {
        link.append(value)
    }
    func pop() -> Int? {
        return link.delete(index: 0)
    }
    func count() -> Int {
        return link.count()
    }
    func show() {
        link.show()
    }
    
}
print("------以下是队列测试------")
let queue = Queue()
queue.push(20)
queue.push(22)
queue.push(25)
queue.push(30)
queue.push(33)

queue.show()
queue.pop()
queue.show()





//: [Next](@next)
