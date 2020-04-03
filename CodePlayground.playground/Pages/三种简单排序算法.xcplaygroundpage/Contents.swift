//: [Previous](@previous)

import Foundation


extension Array where Element == Int {
    
    // 插入排序
    func insertSort() -> [Element] {
        if self.count <= 1 {
            return self
        }
        var res:[Element] = self
        for i in 0..<self.count {
            let value = res[i]
            var comparaIndex = i - 1
            while comparaIndex >= 0 {
                if value > res[comparaIndex] {
                    break
                }
                res[comparaIndex + 1] = res[comparaIndex]
                res[comparaIndex] = value
                comparaIndex -= 1
            }
        }
        return res
    }
    // 冒泡排序
    func bubbleSort() -> [Element] {
        if self.count <= 1 {
            return self
        }
        var res = self
        for i in 0..<count - 1 {
            for j in 0..<count - 1 - i {
                if res[j + 1] < res[j] {
                    let temp = res[j]
                    res[j] = res[j + 1]
                    res[j + 1] = temp
                }
            }
        }
        return res
    }
    // 选择排序
    func select() -> [Element] {
        if self.count <= 1 {
            return self
        }
        var res = self
        for i in 0..<count - 1 {
            var miniIndex = i;
            for j in i..<count {
                if res[j] < res[miniIndex] {
                    miniIndex = j
                }
            }
            if miniIndex != i {
                let temp = res[miniIndex]
                res[miniIndex] = res[i]
                res[i] = temp
            }
        }
        return res
    }

}

let array: [Int] = [2, 5, 3, 1, 7, 4, 9, 8, 6, 20,1000, 10, 11, 12, 90]

let res = array.insertSort()
let bubbleRes = array.bubbleSort()
let selectRes = array.select()

print(res)
print(bubbleRes)
print(selectRes)



//: [Next](@next)
