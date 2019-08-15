//: [Previous](@previous)

import Foundation


//: ### 赋值运算符
let b = 10
var a = 5
a = b

//: 如果赋值符号右侧是拥有多个值的元组，它的元素将会一次性地拆分成常量或者变量：

let (x, y) = (1, 2)
print(x, y)

//: ### 算术运算符
//: - 加 (+)
//: - 减 (-)
//: - 乘 (*)
//: - 除 (/)

//: 此处省略比较运算符/一元/二元/三元/组合赋值/合并空值运算符

// 加法运算符同时也支持 String  的拼接
let addString = "hello" + "swift"
print(addString)

//: ### 区间运算符
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//: ### 半开区间运算符
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//: ### 单侧区间
for name in names[2...] {
    print(name)
}
// Brian
// Jack
for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-10)  // true

//: 逻辑运算符省略


//: [Next](@next)
