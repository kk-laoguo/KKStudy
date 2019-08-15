//: [Previous](@previous)

import Foundation

//: 数组
/**
 数组以有序的方式来储存相同类型的值。相同类型的值可以在数组的不同地方多次出现。
*/
//: 创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []
//: 使用默认值创建数组
/**
 Swift 的 Array类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。
 你可以传给初始化器对应类型的默认值（叫做 repeating）和新数组元素的数量（叫做 count）：
 */
var threeDoubles = Array(repeating: 0.0, count: 3)

//: 通过连接两个数组来创建数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles
//: 使用数组字面量创建数组
var shoppingList: [String] = ["Eggs", "Milk"]


//: 访问和修改数组
print("The shopping list contains \(shoppingList.count) items.")
/**isEmpty属性来作为检查 count属性是否等于 0的快捷方式：*/
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
print(shoppingList)
shoppingList[4...6] =  ["Bananas", "Apples"]
print(shoppingList)
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()
//: 遍历一个数组
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")

}

//: Set 集合
/*
 Swift 的合集类型写做 Set<Element>，这里的 Element是合集要储存的类型。不同与数组，合集没有等价的简写。
 */

//: 创建并初始化一个空合集
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []
//: 使用数组字面量创建合集

//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
//: 访问和修改合集
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
/*
 调用 insert(_:)方法来添加一个新的元素到合集：
 */
favoriteGenres.insert("Jazz")
print(favoriteGenres)

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")

}
/*
 检查合集是否包含了特定的元素，使用 contains(_:)方法。
 */
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
if shoppingList.contains("Bananas") {
    print("shoppingList contain Bananas")
} else {
    print("shoppingList not contain Bananas")

}
//: 遍历合集
for genre in favoriteGenres {
    print("\(genre)")
}
/*
 Swift 的 Set类型是无序的。要以特定的顺序遍历合集的值
 使用 sorted()方法，它把合集的元素作为使用 < 运算符排序了的数组返回。
 */

for genre in favoriteGenres.sorted() {
   print(genre)
}

//: 执行合集操作
//: - 使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；
//: - 使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；
//: - 使用 union(_:)方法来创建一个包含两个合集所有值的新合集；
//: - 使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.union(evenDigits).sorted()
// []
oddDigits.intersection(evenDigits).sorted()
// [1, 9]
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
//: 合集成员关系和相等性
//: - 使用“相等”运算符 ( == )来判断两个合集是否包含有相同的值；
//: - 使用 isSubset(of:) 方法来确定一个合集的所有值是被某合集包含；
//: - 使用 isSuperset(of:)方法来确定一个合集是否包含某个合集的所有值；
//: - 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:)方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；
//: - 使用 isDisjoint(with:)方法来判断两个合集是否拥有完全不同的值。

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
 
houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)

//: 字典
//: 创建一个空字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
//: 用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//: 访问和修改字典
print("The airports dictionary contains \(airports.count) items.")
/*
 使用布尔量 isEmpty属性作为检查 count属性是否等于 0的快捷方式：
 */
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
/*
 用下标脚本给字典添加新元素。使用正确类型的新键作为下标脚本的索引，
 */
airports["LHR"] = "London"
print(airports)

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}


airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
//: 遍历字典

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports {
    print("Airport name: \(airportName)")
}
//: Swift 的 Dictionary类型是无序的。要以特定的顺序遍历字典的键或值，使用键或值的 sorted()方法。




//: [Next](@next)
