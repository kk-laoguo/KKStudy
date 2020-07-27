//
//  main.swift
//  二分搜索法
//
//  Created by zainguo on 2019/8/6.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


//func binarySearch(sortedElements: [Int], for element: Int) -> Bool {
//    var lo = 0, hi = sortedElements.count - 1
//    while lo <= hi {
//        let mid = lo + (hi - lo) / 2;
//        if sortedElements[mid] == element {
//            return true
//        } else if (sortedElements[mid] < element) {
//            lo = mid + 1
//        } else {
//            lo = mid - 1
//        }
//    }
//    return false
//}


extension Array where Element: Comparable {
    
    public var isSorted: Bool {
        var previsousIndex = startIndex
        var currentIndex = startIndex + 1
        while currentIndex != endIndex {
            if self[previsousIndex] > self[currentIndex] {
                return false
            }
            previsousIndex = currentIndex
            currentIndex = currentIndex + 1
        }
        return true
    }
    
}

func binarySearchs<T: Comparable>(sortedElements: [T], for element: T) -> Bool {
    // 确保输入的数组是按序排列的
    assert(sortedElements.isSorted, "输入的数组必须是有序的")
    var lo = 0, hi = sortedElements.count - 1
    while lo <= hi {
        let mid = lo + (hi - lo)/2
        if sortedElements[mid] == element {
            return true
        } else if (sortedElements[mid] < element) {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
        
    }
    return false
    
}

let ss = binarySearchs(sortedElements: [1,2,3,4,5,6, 15], for: 15)
let a = binarySearchs(sortedElements: ["4", "2", "3"], for: "4")

print(ss)

//let isBinary = binarySearch(sortedElements: [100, 90, 80, 111, 120], for: 100)
//print(isBinary)

