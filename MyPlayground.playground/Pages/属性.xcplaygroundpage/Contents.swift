//: [Previous](@previous)

import Foundation

//: 存储属性

struct FixedLengthRange {
    var firstValue: Int
    var Length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, Length: 3)
rangeOfThreeItems.firstValue = 6

//: 常量结构体实例的存储属性
let rangeOfFourItems2 = FixedLengthRange(firstValue: 0, Length: 4)
//rangeOfFourItems2.firstValue = 6

//: 延迟存储属性
class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importter = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importter.fileName)

//: 计算属性
struct Point {
    var x = 0.0, y = 0.0
    
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width) / 2.0
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        // 简写设置器（setter）声明
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


//: 缩写读取器（getter）声明
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            // swift 5.0 这里可以省略return
           return Point(x: origin.x + size.width / 2,
                  y: origin.y + size.height / 2)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
//: 只读计算属性
/*
 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。
 只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值。
 */
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    // 只读计算属性volume
    var volume: Double {
        
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 3.0, height: 3.0, depth: 5.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
//: 属性观察者
/*
 你可以为你定义的任意存储属性添加属性观察者，除了延迟存储属性。
 你也可以通过在子类里重写属性来为任何继承属性（无论是存储属性还是计算属性）添加属性观察者。
 属性重载将会在重写中详细描述。
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")

            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//: 类型属性语法
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }

}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeStructure.storedTypeProperty)
// prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// prints "6"
print(SomeClass.computedTypeProperty)
// prints "27"
print(SomeClass.overrideableComputedTypeProperty)

//: [Next](@next)
