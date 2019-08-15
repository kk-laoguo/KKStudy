//: [Previous](@previous)

import Foundation

//: 闭包表达式语法
let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
 ]

let numbers = [16,58,510]
let string = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
        print("\(output)      \(number)")
    } while number > 0
    return output
}
print(string)


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
//: 闭包是引用类型(函数和闭包都是引用类型)

//: 逃逸闭包
/*
 当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，
 因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，
 你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。
 */

var completionHandlers: [() -> ()] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
//: 自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)
print("Now serving \(customerProvider())!")

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0)})
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve2(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve2(customer: customersInLine.remove(at: 0))// Prints "Now serving Ewa!"



//: [Next](@next)
