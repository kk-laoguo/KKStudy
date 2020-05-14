//
//  main.swift
//  1095. 山脉数组中查找目标值
//
//  Created by zainguo on 2020/4/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


// 852题
// This is MountainArray's API interface.
 // You should not implement it, or speculate about its implementation
protocol MountainArray {
     func get(_ index: Int) -> Int
     func length() -> Int
    
}

class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: [Int]) -> Int {
        var left = 0, right = mountainArr.count - 1, mid = 0
        // 寻找山顶元素
        while left < right {
            mid = left + (right - left) / 2
            let midValue = mountainArr[mid]
            if midValue < mountainArr[mid + 1] {
                // 下一轮区间是[mid + 1, right]
                left = mid + 1
            } else {
                right = mid
            }
        }
        // left == right
        let res = findSortedArray(mountainArr, 0, left, target)
        if res != -1 {
            return res
        }
        return findReverseArray(mountainArr, left + 1, mountainArr.count - 1, target)
        
    }
    
    // 正序
    func findSortedArray(_ mountainArr: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var mid = 0, left = left, right = right
        while left <= right {
            mid = left + (right - left) / 2
            let midValue = mountainArr[mid]
            if midValue == target {
                return mid
            }
            if midValue < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
    // 逆序
    func findReverseArray(_ mountainArr: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var mid = 0, left = left, right = right
        while left <= right {
            mid = left + (right - left) / 2
            let midValue = mountainArr[mid]
            if midValue == target {
                return mid
            }
            if midValue < target {
                right = mid - 1
                
            } else {
                left = mid + 1
            }
        }
        return -1
    }
   
}


let res = Solution().findInMountainArray(3, [1,2,3,4,5,3,1])

print(res)

//class Solution {
//    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
//        var left = 0, right = mountainArr.length() - 1, mid = 0
//        // 寻找山顶元素
//        while left <= right {
//            mid = left + (right - left) / 2
//            let midValue = mountainArr.get(mid)
//            if midValue < mountainArr.get(mid + 1) {
//                // 下一轮区间是[mid + 1, right]
//                left = mid + 1
//            } else {
//                right = mid
//            }
//        }
//        // left == right
//        let res = findSortedArray(mountainArr, 0, left, target)
//        if res != -1 {
//            return res
//        }
//        return findReverseArray(mountainArr, left + 1, mountainArr.length() - 1, target)
//
//    }
//
//    // 正序
//    func findSortedArray(_ mountainArr: MountainArray, _ left: Int, _ right: Int, _ target: Int) -> Int {
//        var mid = 0, left = left, right = right
//        while left <= right {
//            mid = left + (right - left) / 2
//            let midValue = mountainArr.get(mid)
//            if midValue == target {
//                return mid
//            }
//            if midValue < target {
//                left = mid + 1
//            } else {
//                right = mid - 1
//            }
//        }
//        return -1
//    }
//    // 逆序
//    func findReverseArray(_ mountainArr: MountainArray, _ left: Int, _ right: Int, _ target: Int) -> Int {
//        var mid = 0, left = left, right = right
//        while left <= right {
//            mid = left + (right - left) / 2
//            let midValue = mountainArr.get(mid)
//            if midValue == target {
//                return mid
//            }
//            if midValue < target {
//                right = mid - 1
//
//            } else {
//                left = mid + 1
//            }
//        }
//        return -1
//    }
//
//}


//func binSearch(_ mountainArr: MountainArray, _ left: inout Int, _ right: inout Int, _ target: Int, _ isReverse: Bool) -> Int {
//
//       var mid = 0
//       while left <= right {
//           mid = left + (right - left) / 2
//           let midValue = mountainArr.get(mid)
//           if midValue == target {
//               return mid
//           }
//           if midValue < target {
//               // 正序排列
//               left = isReverse ? left:mid + 1
//               // 反序排列
//               right = isReverse ? mid - 1 : right
//
//
//           } else {
//               // 正序排列
//               right = isReverse ? right:mid - 1
//               // 反序排列
//               left = isReverse ? mid + 1:left
//
//           }
//       }
//       return -1
//   }
