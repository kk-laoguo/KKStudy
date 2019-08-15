//: [Previous](@previous)

import Foundation

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
    
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//: 子类
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2
print("Tandem: \(tandem.description)")

//: 重写
//: 重写方法

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//: 重写属性
//: 重写属性的GETTER和SETTER
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3

print("Car: \(car.description)")

//: 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Automatic: \(automatic.description)")

//: 阻止重写
/*
 你可以通过标记为终点来阻止一个方法、属性或者下标脚本被重写。
 通过在方法、属性或者下标脚本的关键字前写 final 修饰符(比如 final var ， final func ，
 final class func ， final subscript )。
 */







//: [Next](@next)
