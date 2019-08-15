//: [Previous](@previous)

import Foundation


//: For-in 循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
/*
 for-in 循环同样能遍历数字区间。这个栗子打印了乘五表格的前几行：
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
/*
 如果你不需要序列的每一个值，你可以使用下划线来取代遍历名以忽略值。
 */
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
let minutes = 60
for tickMark in 0..<minutes {
}
/*
 些用户可能想要在他们的UI上少来点分钟标记。
 比如说每 5 分钟一个标记吧。
 使用 stride(from:to:by:) 函数来跳过不想要的标记。
 */
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("---> + \(tickMark)")
}
//: While 循环
//: - while 在每次循环开始的时候计算它自己的条件；
//: - repeat-while 在每次循环结束的时候计算它自己的条件。

//: 条件语句 if

//: Switch


let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a","A":
    print("The letter A")
    
default:
    print("Not the letter A")
}
//: 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "hundreds of"
}
//prints "There are dozens of moons orbiting Saturn."
print("There are \(naturalCount) \(countedThings).")

//: 元组
/*
 可以使用元组来在一个 switch 语句中测试多个值。
 每个元组中的元素都可以与不同的值或者区间进行匹配。
 另外，使用下划线（ _）来表明匹配所有可能的值。
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
//: 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case (let x, let y):
    print("somewhere else at (\(x), \(y))")
}

//: Where
/*
 switch 情况可以使用 where 分句来检查额外的情况。
 */
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//: 复合情况
/*
 多个 switch 共享同一个函数体的多个情况可以在 case 后写多个模式来复合，在每个模式之间用逗号分隔。
 如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。如果模式太长，可以把它们写成多行，比如说：
 */
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//: 控制转移语句
/*
 continue
 break
 fallthrough
 return
 throw
 */

//: Continue
//: > continue语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。
//: > 它是说“我不再继续当前的循环遍历了”而不是离开整个的循环。


//: Break
//: > break 语句会立即结束整个控制流语句。
//: > 当你想要提前结束 switch 或者循环语句或者其他情况时可以在 switch 语句或者循环语句中使用 break 语句。
/*
 fallthrough 关键字不会为switch情况检查贯穿入情况的条件。
 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样。
 */
//: Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
// prints "The number 5 is a prime number, and also an integer."
print(description)

//: 检查API的可用性

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
/*
 上边的可用性条件确定了在 iOS 平台， if 函数体只在 iOS 10 及以上版本才会执行；
 对于 macOS 平台，在只有在 macOS 10.12 及以上版本才会运行。
 最后一个实际参数， * ，它需求并表明在其他所有平台， if 函数体执行你在目标里明确的最小部属。
 */


//: [Next](@next)
