//: [Previous](@previous)

import Foundation



let array = [1,2,3,4,5,6,7,8,10,17]

extension Array where Element == Int {
    func searchElement(x: Int) -> Bool {
        for item in self {
            if item == x {
                return true
            }
        }
        return false
    }
}
extension Array where Element == Int {
    func binarySearch(x: Int) -> Bool {
        if self.count == 0 {
            return false
        }
        var res = false
        let min = self.startIndex
        // self.endIndex 表示是最后一个元素的下一个元素
        let max = self.endIndex - 1
        let mid = Int((min + max) / 2)
        let value = self[mid]
        if x == value {
            return true
        } else if x < value {
            let arr = min < mid ? Array(self[min..<mid]):[Int]()
            res = arr.binarySearch(x: x)
            
        } else {
            let arr = mid < max ? Array(self[mid + 1...max]):[Int]()
            res = arr.binarySearch(x: x)
        }
        return res
    }
}

array.searchElement(x: 2)
array.binarySearch(x: 20)



//: [Next](@next)
