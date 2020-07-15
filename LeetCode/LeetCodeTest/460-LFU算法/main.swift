//
//  main.swift
//  460-LFU算法
//
//  Created by zainguo on 2020/4/5.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Node {
    var key: Int
    var value: Int
    var count: Int
    var prev: Node?
    var next: Node?
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
        count = 1
    }
}

class DLList {
    var head: Node?
    var tail: Node?
    var len = 0
    var map = [Int: Node]()
    init() {
        head = Node(0, 0)
        tail = Node(0, 0)
        head?.next = tail
        tail?.prev = head
    }
    func addHead(_ node: Node) {
//        node.prev = head
//        node.next = head?.next
//        node.next?.prev = node
//        head?.next = node
        let next = head?.next
        head?.next = node
        node.prev = head
        node.next = next
        next?.prev = node
        map[node.key] = node
        len += 1
    }
    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        len -= 1
        map.removeValue(forKey: node.key)
    }
    func removeTail() {
        let node = tail!.prev!
        remove(node)
    }
}



class LFUCache {
    var freqMap: [Int: DLList]
    var nodeMap: [Int: Node]
    var size = 0
    var capacity = 0
    var maxFreq = Int.max
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.freqMap = [Int: DLList]()
        self.nodeMap = [Int: Node]()
    }
    func get(_ key: Int) -> Int {
        if let node = nodeMap[key] {
            
        } else {
            return -1
        }
        
    }
    func put(_ key: Int) -> Int {
        
    }
    func upateNode(_ node: Node) {
        if let list = freqMap[node.count] {
            list.remove(node)
            if node.count == maxFreq {
                <#code#>
            }
        }
    }
}
