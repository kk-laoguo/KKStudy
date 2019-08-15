//: [Previous](@previous)

import Foundation


//: 定义语法

struct Resolutation {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolutation()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolutation()
let someVideoMode = VideoMode()

//: 访问属性
print("The width of someResolution is \(someResolution.width)")
//: 结构体类型的成员初始化器
/*
 所有的结构体都有一个自动生成的成员初始化器，你可以使用它来初始化新结构体实例的成员属性。
 新实例属性的初始化值可以通过属性名称传递到成员初始化器中：
 */

let vga = Resolutation(width: 640, height: 480)

//: 结构体和枚举是值类型
/*
 Swift 中所有的结构体和枚举都是值类型
 这意味着你所创建的任何结构体和枚举实例——和实例作为属性所包含的任意值类型——在代码传递中总是被拷贝的。
 */

let hd = Resolutation(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//: 类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//: 特征运算符
//: - 相同于 ( ===)
//: - 不相同于( !==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}



//: [Next](@next)
