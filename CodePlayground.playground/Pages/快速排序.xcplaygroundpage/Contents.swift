//: [Previous](@previous)

import Foundation

extension Array where Element == Int {
    
    mutating func quickSort() {
        quick_sort(0, self.count)
    }
    private mutating func quick_sort(_ begin: Int, _ count: Int) {
        
        let n = count - begin
        if n == 0 || n == 1 {
            return
        }
        let point = begin
        var index = begin
        var end = count - 1
        
        out: while end != index {
            
            // 先找出右边比定点大的数
            // 右边的值比定点小就就等待交换
            while self[end] >= self[point] {
                if end == index {
                    break out
                }
                end -= 1
            }
            // 找出左边比定点大的值
            while self[index] <= self[point] {
                if end == index {
                    break out
                }
                index += 1
            }
            // 当 当前索引比定点point大的时候, 交换end和当前索引的值
            // 这样之后左边的都是比定点值小 右边都是比定点值大
            let temp = self[end]
            self[end] = self[index]
            self[index] = temp
        }
        // end 和 index 重叠交换值
        let temp = self[point]
        self[point] = self[index]
        self[index] = temp
        self.quick_sort(begin, index)
        self.quick_sort(index + 1, count)
    }
}

var array: [Int] = [2, 5, 3, 1, 7, 4, 9, 8, 6, 20,1000, 10, 11, 12, 90]
array.quickSort()

print(array)
//: [Next](@next)
