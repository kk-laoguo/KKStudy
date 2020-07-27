//
//  main.swift
//  并发进程中的问题
//
//  Created by zainguo on 2019/8/8.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

// 竞态条件
var num = 0
DispatchQueue.global().async {
    for _ in 1...10000 {
        num += 1
    }
}
for _ in 1...10000 {
    num += 1
}
print(num)
// 优先倒置

var highPriorityQueue = DispatchQueue.global(qos: .userInitiated)
var lowPriorityQueue = DispatchQueue.global(qos: .utility)

let semaphore = DispatchSemaphore(value: 1)

lowPriorityQueue.async {
    semaphore.wait()
    for i in 0...10 {
        print(i)
    }
    semaphore.signal()
}

highPriorityQueue.async {
    semaphore.wait()
    for i in 11...20 {
        print(i)
    }
    semaphore.signal()
}

// 场景1: 将异步函数调整为同步, 因为wait的存在, 能够保证'step 5'一定能在'step 2'之后执行, 整个程序看上去像是顺序执行了。
/// 本场景中, 程序执行到wait时, 由于当前信号量为0, 会阻塞当前线程。
/// 此时global线程仍在并行执行, 它会等待2秒后, 执行signal让信号量加1。
/// 由于检测到有处于wait状态的线程(主线程), 于是将这个线程唤起, 这就造成了有两个线程同时执行, 作为结果的'step 3'和'step 5'的输出顺序不定。
//原文链接：https://blog.csdn.net/huayu608/article/details/90407175

func example1() {
    let semaphore = DispatchSemaphore(value: 0)
    print("step 1")
    DispatchQueue.global().async {
        sleep(2)
        print("step 2")
        semaphore.signal()
        print("step 3")
    }
    print("step 4")
    semaphore.wait()
    print("step 5")
}


/// 场景2: 线程锁, wait与signal构成了加锁和解锁的要素, 这对函数之间的代码会被保护起来, 不会同时执行。
/// 本场景中, 两个global线程并行执行, 因此'step 10'和'step 20'的输出顺序不定。注意: 先执行'step'的线程, 不一定会先执行wait。
/// 先到达wait的线程, 由于当前信号量为1, 因此可以顺利执行下去, 顺便会将信号量减1。
/// 后到达wait的线程, 由于当前信号量为0, 会阻塞当前线程(后到线程)。
/// 当先线程执行signal后, 会令信号量加1, 于是唤起了后到线程, 后到线程的阻塞状态解除。
func example2() {
    
    let semaphore = DispatchSemaphore(value: 1)
    print("step 00")
    
    DispatchQueue.global().async {
        sleep(2)
        print("step 10")
        semaphore.wait()
        print("step 11")
        sleep(2)
        print("step 12")
        semaphore.signal()
        print("step 13")
    }
    
    DispatchQueue.global().async {
        sleep(2)
        print("step 20")
        semaphore.wait()
        print("step 21")
        sleep(2)
        print("step 22")
        semaphore.signal()
        print("step 23")
    }
    print("step 01")
}


//example1()
//example2()

/// 死锁问题
let operationA = BlockOperation()
let operationB = BlockOperation()

operationA.addExecutionBlock {
    print("A"+"\(Thread.current)")

}
operationB.addExecutionBlock {
    print("B"+"\(Thread.current)")
}

let queueA = OperationQueue()
operationA.addDependency(operationB)
operationB.addDependency(operationA)
//operationA.start()
//operationB.start()
//queueA.addOperations([operationA, operationB], waitUntilFinished: false)

let serialQueue = DispatchQueue(label: "serialQueue")
serialQueue.async {
    print("1"+"\(Thread.current)")
    serialQueue.sync {
        print("2"+"\(Thread.current)")
    }
}

print("3"+"\(Thread.current)")



