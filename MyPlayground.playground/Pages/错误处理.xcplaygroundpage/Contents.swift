//: [Previous](@previous)

import Foundation

//: 表示和抛出错误
enum VendingMachineError: Error {
    
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: 使用抛出函数传递错误
//: 使用 Do-Catch 处理错误

//: Any 和 AnyObject 的类型转换

// :Swift 为不确定的类型提供了两种特殊的类型别名：
// - AnyObject  可以表示任何类类型的实例。
// - Any  可以表示任何类型，包括函数类型。




//: [Next](@next)
