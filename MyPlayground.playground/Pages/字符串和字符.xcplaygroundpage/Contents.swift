//: [Previous](@previous)

import Foundation

//: 字符串是值类型
//: 字符串字面量
let someString = "Some string literal value"
//: 多行字符串字面量
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

print(singleLineString)
print(multilineString)

/**
 当你的代码中在多行字符串字面量里包含了换行，那个换行符同样会成为字符串里的值。
 如果你想要使用换行符来让你的代码易读，却不想让换行符成为字符串的值，那就在那些行的末尾使用反斜杠（ \ ）
 */
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,\
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on\
till you come to the end; then stop."
"""

print(softWrappedQuotation)

print("------------------")

let lineBreaks = """
 
This string starts with a line break.
It also ends with a line break.
 
"""
print(lineBreaks)

//: 字符串字面量里的特殊字符
// "Imagination is more important than knowledge" - Einstein
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// $, Unicode scalar U+0024
let dollarSign = "\u{24}"
// ♥, Unicode scalar U+2665
let blackHeart = "\u{2665}"
// 💖️, Unicode scalar U+1F496
let sparklingHeart = "\u{1F496}"

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

//: 扩展字符串分隔符

let threeMoreDoubleQuotationMarks = #"Line 1\nLine 2"#
let threeMoreDoubleQuotationMarks2 = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)
print(threeMoreDoubleQuotationMarks2)
//: 初始化一个空字符串
var emptyString = ""
var anotherEmptyString = String()
// 通过检查布尔量 isEmpty属性来确认一个 String值是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
}
    
//: 字符串可变性
var variableString = "Horse"
variableString += " and carriage"
var constantString = "Highlander"
constantString += " and another Highlander"

print(variableString, constantString)

//: 操作字符
for character in "Dog!🐶️" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱️"]
let catString = String(catCharacters)
print(catString)
//: 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// one
// twothree

//: 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)

//: 访问和修改字符串
let greeting = "Guten Tag!"
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a
//: 尝试访问的 Character如果索引位置在字符串范围之外，就会触发运行时错误。
//greeting[greeting.endIndex] // error
//greeting.index(after: endIndex) // error

//: 使用 indices属性来访问字符串中每个字符的索引。

for index in greeting.indices {
    // Prints "G u t e n   T a g ! "
    print("\(greeting[index]) ", terminator: "")
}
// 你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ， index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ， Dictionary 和 Set 。

//: 插入和删除
var we = "hello"
we.insert("!", at: we.endIndex)// welcome now equals "hello!"

//we.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

//we.remove(at: we.index(before: we.endIndex))

let range = we.index(we.endIndex, offsetBy: -6)..<we.endIndex
//we.removeSubrange(range)


//: 字符串比较
let quo = "We're a lot alike, you and I."
let sameQuo = "We're a lot alike, you and I."
if quo == sameQuo {
    print("\nThese two strings are considered equal")

}


//: 前缀和后缀相等性

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
// Prints "There are 5 scenes in Act 1"
print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
// Prints "6 mansion scenes; 2 cell scenes"
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")



//: [Next](@next)
