//: [Previous](@previous)

import Foundation

//: 定义和调用函数
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

//: ### 函数的形式参数和返回值
//: 无形式参数的函数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//: 多形式参数的函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

//: 无返回值的函数
/*
 严格来讲，函数 greet(person:)还是有一个返回值的，尽管没有定义返回值。
 没有定义返回类型的函数实际上会返回一个特殊的类型 Void。
 它其实是一个空的元组，作用相当于没有元素的元组，可以写作 () 。
 */
func greets(person: String) {
    print("Hello, \(person)!")
}
greets(person: "Dave")
// Prints "Hello, Dave!"

//: 当函数被调用时，函数的返回值可以被忽略：
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
printAndCount(string: "hello world")

//: 多返回值的函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: 可选元组返回类型
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax2(array: [0, -10, 20, 100, 90, 103]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
//: 隐式返回的函数
/*
 如果整个函数体是一个单一表达式，那么函数隐式返回这个表达式，比如说，下边的两个函数有着相同的行为：
 */
//func greeting2(for person: String) -> String {
//    "Hello, " + person + "!"
//}
//print(greeting2(for: "Dave"))

//: 函数实际参数标签和形式参数名
//: 指定实际参数标签
func greet3(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet3(person: "Bill", from: "Cupertino"))
//: 省略实际参数标签

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
}
someFunction(1, secondParameterName: 2)
//: 默认形式参数值

func someFunction2(parameterWithDefault: Int = 12) {
   
}
someFunction2(parameterWithDefault: 6) // parameterWithDefault is 6
someFunction2() // parameterWithDefault is 12

//: 可变形式参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

//: 输入输出形式参数
/*
 输入输出形式参数不能有默认值
 可变形式参数不能标记为 inout，
 如果你给一个形式参数标记了 inout，那么它们也不能标记 var和 let了。
 */

var someInt = 3
var anotherInt = 107
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: 函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
//: 函数类型作为形式参数类型
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts(_:_:), 3, 5)
// Prints "Result: 8"
//: 函数类型作为返回类型
//: 内嵌函数

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//: [Next](@next)
