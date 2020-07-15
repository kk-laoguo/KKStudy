//
//  main.swift
//  146. LRU缓存机制
//
//  Created by zainguo on 2020/5/25.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Node {
    let key: Int
    var value: Int
    var next: Node?
    var pre: Node?
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
   
    var head: Node
    var tail: Node
    var cache: [Int: Node]
    let capacity: Int
    
    init(_ capacity: Int) {
        cache = [Int: Node]()
        cache.reserveCapacity(capacity)
        self.capacity = capacity
        self.head = Node(key: 0, value: 0)
        self.tail = Node(key: 0, value: 0)
        self.head.next = self.tail
        self.tail.pre = self.head
    }
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node)
            return node.value
        }
        
        return -1
        
    }
    func put(_ key: Int, _ value: Int) {
        if get(key) != -1 {
            cache[key]?.value = value
            return
        }
        if cache.count == self.capacity {
            let node = popTail()
            cache[node.key] = nil
            
        }
        let node = Node(key: key, value: value)
        cache[key] = node
        addNode(node)
    }
    
    func moveToHead(_ node: Node) {
        removeNode(node)
        addNode(node)
        
    }
    func removeNode(_ node: Node) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    func addNode(_ node: Node) {
        node.pre = head
        node.next = head.next
        head.next?.pre = node
        head.next = node
    }
    // 删除最后一个节点并且返回该节点
    func popTail() -> Node {
        let last = tail.pre!
        removeNode(last)
        return last
        
    }
}
