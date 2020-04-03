//: [Previous](@previous)


import UIKit

let str = "Hello, playground"

let justOverOneMillion = 1_000_000.000_000_1

/**
 Int8 类型的常量或变量可以存储的数字范围是 -128~127
 UInt8 类型的常量或者变量能存储的数字范围是 0~255
 */
//let cannotBeNegative: UInt8 = -1
// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// 元组
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
// 使用元组, 不需要的数据可以使用下划线_代替
let (justStatusCode, _) = http404Error
print("The status code is \(justStatusCode)")
// 索引访问
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
// 定义元组: 可以直接给其中的元素命名
let http200Status = (code: 200, description: "Ok")
print("The status code is \(http200Status.code)")
print("The status message is \(http200Status.description)")

// 可选属性
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
// 隐式展开
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

// 错误处理
func makeASandwich() throws {
    
}
// 断言和先决条件
let age = 3
assert(age >= 0, "A Person's age cannot be less than zero")





//: [Next](@next)
