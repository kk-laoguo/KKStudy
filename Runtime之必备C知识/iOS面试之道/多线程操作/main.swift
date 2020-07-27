//
//  main.swift
//  多线程操作
//
//  Created by zainguo on 2019/8/7.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

let serialQueue = DispatchQueue(label: "serialQueue1")
let concurrentQueue = DispatchQueue(label: "concurrentQueue1", qos: .default, attributes: .concurrent)

/// 串行同步
func serialSync() {
    serialQueue.sync {
        print(1)
    }
    print(2)

    serialQueue.sync {
        print(3)
    }
    print(4)
}
/// 串行异步
func serialAsync() {
    serialQueue.async {
        print(1)
    }
    print(2)

    serialQueue.async {
        print(3)
    }
    print(4)
}
/// 串行异步嵌套同步
/*
 串行异步队列只会开启一个新的线程, 在此线程中又开始同步串行队列, 两者会形成相互等待
 */
func serialAsyncAndSync() {
    print("1"+"\(Thread.current)")
    serialQueue.async {
        print("2"+"\(Thread.current)")
        serialQueue.sync {
            print("3" + "\(Thread.current)")
        }
        print("4"+"\(Thread.current)")
    }
    print("5"+"\(Thread.current)")
}

/// 串行同步嵌套异步
func serialsyncAndAsync() {
    print(1)
    serialQueue.sync {
        print(2)
        serialQueue.async {
            print(3)
        }
        print(4)
    }
    print(5)
}

//serialSync()
//serialAsync()
//serialAsyncAndSync()
//serialsyncAndAsync()



/// 并行同步
func concurrentSync() {
    concurrentQueue.sync {
        print(1)
    }
    print(2)

    concurrentQueue.sync {
        print(3)
    }
    print(4)
}
/// 并行异步
func concurrentAsync() {
    concurrentQueue.async {
        print(1)
    }
    print(2)

    concurrentQueue.async {
        print(3)
    }
    print(4)
}
/// 并行异步嵌套同步
func concurrentAsyncAndSync() {
    print("1"+"\(Thread.current)")
    concurrentQueue.async {
        print("2"+"\(Thread.current)")
        concurrentQueue.sync {
            print("3" + "\(Thread.current)")
        }
        print("4"+"\(Thread.current)")
    }
    print("5"+"\(Thread.current)")
}

/// 并行同步嵌套异步
func concurrentsyncAndAsync() {
    print(1)
    concurrentQueue.sync {
        print(2)
        concurrentQueue.async {
            print(3)
        }
        print(4)
    }
    print(5)
}

//concurrentSync()
//concurrentAsync()
//concurrentAsyncAndSync()
concurrentsyncAndAsync()
