//: [Previous](@previous)

import Foundation
//: 实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
//: 调用实例方法与属性一样都是用点语法：
let counter = Counter()
counter.increment()
counter.increment(by: 5)
print("\(counter.count)")
counter.reset()
print("\(counter.count)")

//: - self 属性

/*
 每一个类的实例都隐含一个叫做 self的属性，它完完全全与实例本身相等。
 你可以使用 self属性来在当前实例当中调用它自身的方法。
 */

//: 在实例方法中修改值类型
/*
 结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改。
*/

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }

}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")


//: 在异变方法里指定自身
/*
 异变方法可以指定整个实例给隐含的 self属性。上文中那个 Point的栗子可以用下边的代码代替：
 */

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
    
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
//: 类型方法
class SomeClass {
    class func someTypeMethod() {
        print("someTypeMethod")
    }
}
SomeClass.someTypeMethod()





//: [Next](@next)
