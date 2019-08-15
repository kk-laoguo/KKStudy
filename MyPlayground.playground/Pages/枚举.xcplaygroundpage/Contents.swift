//: [Previous](@previous)

import Foundation


//: 枚举语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionToHead = CompassPoint.west
directionToHead = .east

//: 使用 Switch 语句来匹配枚举值
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

//: 遍历枚举情况（case）
//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}
//for beverage in Beverage.allCases {
//    print(beverage)
//}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


var productBarcode = Barcode.upc(8, 8888, 999999, 2)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
/*
 如果对于一个枚举成员的所有的相关值都被提取为常量，或如果都被提取为变量，
 为了简洁，你可以用一个单独的 var或 let在成员名称前标注：
 */
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

//: 原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//: 隐式指定的原始值
enum Planet: Int {
    
    case mercury = 1, venus, earth, mars, jumpiter
}
enum CompassPointString: String {
    case north, south, east, west
}

let earthsOrder = Planet.earth.rawValue
let sunsetDirection = CompassPointString.west.rawValue
//: 从原始值初始化

//: 递归枚举
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

/*
 你同样可以在枚举之前写 indirect 来让整个枚举成员在需要时可以递归
 */
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))



func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))


//: [Next](@next)
