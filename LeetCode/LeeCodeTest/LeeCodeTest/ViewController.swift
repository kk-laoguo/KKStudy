//
//  ViewController.swift
//  LeeCodeTest
//
//  Created by zainguo on 2019/11/28.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Cocoa




class NumArray {
    
    private var nums = [Int]()
    private var sums: [Int] = []
    init(_ nums: [Int]) {
//        self.nums = nums
        if nums.count == 0 {
            return
        }
        // sums[i]: sum[0] + sum[1] + .... + sum[i]
        // sum[i] = sum[i - 1] + nums[i + 1] i>= 1
        sums = [Int](repeating: 0, count: nums.count)
        sums[0] = nums[0]
        for i in 1..<nums.count {
            sums[i] = sums[i - 1] + nums[i]
        }
    }
    func sumRange(_ i: Int, _ j: Int) -> Int {
//        var sum = 0
//        for index in i...j {
//            sum += self.nums[index]
//        }
//        return sum
        if i == 0 {
            return sums[j]
        }
        return sums[j] - sums[i - 1]
    }
}

class NumMatrix {
    private var sums: [[Int]] = [[]]
    
    init(_ matrix: [[Int]]) {
        if matrix.isEmpty {
            return
        }
        // sums[i][j] = sum(maxtrix[0][0] ~ matrix[i - 1][j - 1])
        sums = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        // 计算任意一个位置[i, j] 到 [0, 0]点的和
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
              // 由于填充了一个元素所以这里全部-1
              // 由于上面sums默认扩充了一行一列所以在计算当前位置大小的时候需要 - 1
              // sums的和只和当前位置/ 左边 / 左上角 / 上面有关系
              // 在计算和的时候 [i-1, j - 1]到[0, 0]的和被重复计算了
              sums[i][j] = matrix[i - 1][j - 1]
                + sums[i - 1][j]
                + sums[i][j - 1]
                - sums[i - 1][j - 1]
            }
        }
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        // 由于数组矩阵增加了一行一列
        return sums[row2 + 1][col2 + 1]
            - sums[row2 + 1][col1]
            - sums[row1][col2 + 1]
            + sums[row1][col1]
    }
}

class Solution {
    
    var word_set: Set<String> = []
    var cache: [String: [String]] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        
        if s.count == 0 {
            return []
        }
        word_set = Set<String>(wordDict)
        return world_break(s)
        
    }
    func world_break(_ s: String) -> [String] {
        if s.count == 0 {
            return [""]
        }
        if let res = cache[s] {
            return res
        }
        var res = [String]()
        for i in 0..<s.count {
            let index = s.index(s.startIndex, offsetBy: i)
            let subStr = String(s[...index])
            if word_set.contains(subStr) {
                let nextIndex = s.index(index, offsetBy: 1)
                let subArr = world_break(String(s[nextIndex...]))
                let fullStr = subArr.map { res -> String in
                    if res == "" {
                        return "\(subStr)"
                    }
                    return "\(subStr) \(res)"
                }
                res += fullStr
            }
        }
        cache[s] = res
        return res
    }
    
}


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let r = dailyTemperatures3([89,62,70,58,47,47,46,76,100,70])
    
//        let r = minimumTotal2([[2],[3,4],[6,5,7],[4,1,8,3]])
//        let r = trap([0,1,0,2,1,0,1,3,2,1,2,1]);
//        let r = dailyTemperatures(
//        [73,74,75,71,69,72,76,73])
        
        // aaa12321
//        let r = minCut("a")
//        let r = minCut("cbbbcc")
        
         
//        let r = Solution().wordBreak("catsanddog", ["cat","cats","and","sand","dog"])
        
//        let str = "lestcodecode"
//        let start = str
//            .index(str.startIndex, offsetBy: 1)
//        let end = str.index(str.startIndex, offsetBy: 3)
//        let str1 = String(str[start..<end])
        
//        let e = str1.index(str1.endIndex, offsetBy: 0)
//        str1.substring(from: str1.endIndex)
  
        
//        let r = wordBreak("bb", ["a","bbb","bbbbbb"])
//        let r = wordBreak("leetcode", ["leet","code"])

//        let r = dailyTemperatures2([76,73])
//       let r = longesValidParentheses("(()")
        
//        let array: [Int] = [2, 5, 3, 1, 7, 4, 9, 8, 6]
        
//        let r = isUgly(1)
//        let r = nthUglyNumber(10)
        
//        let num = NumMatrix(<#[[Int]]#>)
//        
//        let r =
//        let r = rob([1,2,1,1])
//        let r = maxProfit([1,2,3,0,2])
//        let r = coinChange([1], 0)
//        let r = numberOfArithmeticSlices([1,2,3,4])
//        let r = findTargetSumWays([1,1,1,1,1], 3)
//        let r = predictTheWinner([1, 5, 2])
        
//        let r = largesRectangleArea([1])
        
//        let r = findNumberOfLIS([1])

        let r = canFinish(3, [[1,0],[2,1]])
        print(r)
        
    }
    
    func canFinish(_ numCourses: Int, _ prerequsites: [[Int]]) -> Bool {
        
        if numCourses <= 0 {
            return false
        }
        if prerequsites.count == 0 {
            // 没有课程，当然可以完成课程的学习
            return true
        }
        // 统计每门学科有多少门前置课程
        var indegree = Array(repeating: 0, count: numCourses)
        for pre in prerequsites {
            indegree[pre[0]] += 1
        }
        // BFS
        var queue = [Int]()
        for i in 0..<numCourses {
            // 首先加入入度为 0 的结点
            // 没有先修课程
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        var count = 0;
        while !queue.isEmpty {
            let pre = queue.removeLast()
            count += 1
            // 把邻边全部遍历一下
            for p in prerequsites {
                if p[1] == pre { // 没有先修课
                    // 找到对应的学科 -1
                    indegree[p[0]] -= 1
                    if indegree[p[0]] == 0 {
                        queue.append(p[0])
                    }
                }
            }
        }
        return count == numCourses
        
    }
    
    func findNumberOfLIS(_ nums: [Int]) -> Int {
                
        let n = nums.count
        if n == 0 {
            return 0
        }
        // 以nums[i] 结尾的最长的递增子序列的数量
        var cnt = [Int](repeating: 1, count: n)
        // 以nums[i] 结尾的最长的递增子序列的长度
        var len = [Int](repeating: 1, count: n)
        var res = 0
        var mx:Int = 0
        for i in 1..<n {
            for j in 0..<i {
                // nums数组中的最后一个元素 > 子序列(短的)数组的最后一个元素
                if nums[i] > nums[j] {
                    // 子序列的长度 + 1 > 当前数组的长度: 表示找到了新的解
                    if len[j] + 1 > len[i] {
                        // 更新当前序列的长度
                        len[i] = len[j] + 1
                        cnt[i] = cnt[j]
                    } else if (len[j] + 1 == len[i]) {
                        cnt[i] += cnt[j]
                    }
                }
            }
            mx = max(mx, len[i])
        }
        for i in 0..<n {
            if mx == len[i] {
                res += cnt[i]
            }
        }
        return res
        
//        var mx:Int = 0
//        var res:Int = 0
//        var n:Int = nums.count
//        var len:[Int] = [Int](repeating:1,count:n)
//        var cnt:[Int] = [Int](repeating:1,count:n)
//        for i in 0..<n
//        {
//            for j in 0..<i
//            {
//                if nums[i] <= nums[j] {continue}
//                if len[i] == len[j] + 1 {cnt[i] += cnt[j]}
//                else if len[i] < len[j] + 1
//                {
//                    len[i] = len[j] + 1
//                    cnt[i] = cnt[j]
//                }
//            }
//            mx = max(mx, len[i])
//        }
//        for i in 0..<n
//        {
//            if mx == len[i]
//            {
//                res += cnt[i]
//            }
//        }
//        return res
    }

    func largesRectangleArea(_ heights: [Int]) -> Int {
        let nums = heights.count
        if nums == 0 {
            return 0
        }
        var stack: [Int] = []
        var maxArea = 0
        let heights = [0] + heights + [0]
        
        for i in 0..<nums {
            
            while !stack.isEmpty && heights[stack.last!] > heights[i] {
                let temp = stack.last!
                stack.removeLast()
                maxArea = max(maxArea, heights[temp] * (i - stack.last! - 1))
            }
            stack.append(i)
        }
        
        
//
//        var maxArea = 0
//        for i in 0..<nums {
//            var minHeight = heights[i]
//            for j in i..<nums {
////                var k = i + 1
////                while k <= j {
////                    minHeight = min(minHeight, heights[k])
////                    k += 1
////                }
//                minHeight = min(minHeight, heights[j])
//                maxArea = max(maxArea, (j - i + 1) * minHeight)
//            }
//        }
        return maxArea
    }
    func predictTheWinner(_ nums: [Int]) -> Bool {
        
        let count = nums.count
        // dp[i][j]表示从nums[i]到nums[j]先手比另一位玩家多的最大分数，
        // 最后返回dp[0][nums.count - 1]是否大于0即可
        // 对于dp[i][j]，如果先手拿了nums[i]，则另一位玩家比先手多dp[i+1][j]，dp[i][j] = nums[i] - dp[i+1][j]
        // 如果先手拿了nums[j]，则另一位玩家比先手多dp[i][j-1]，dp[i][j] = nums[j]-dp[i][j-1]
    
        var dp = [[Int]](repeating: [Int](repeating: 0, count: count), count: count)
        for i in 0..<count {
            dp[i][i] = nums[i]
        }
        
        for i in (0..<count).reversed() {
            var j = i + 1
            while j < count {
                dp[i][j] = max(nums[i] - dp[i + 1][j], nums[j] - dp[i][j - 1])
                j += 1
            }
        }
        
        return dp[0][count - 1] >= 0
    }

  
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
        var sum = 0
        for item in nums {
            sum += item
        }
        if sum < S {
            return 0
        }
        var res = 0
        dfs_findTarget(nums, S, 0, &res)
        return res
    }
    func dfs_findTarget(_ nums: [Int], _ S: Int, _ i: Int, _ res: inout Int) {
        if i == nums.count {
            if S == 0  {
                res += 1
            }
            return
        }
        // 上一个元素选的是 + 号, 所以 S 减少了
        dfs_findTarget(nums, S - nums[i], i + 1, &res)
        // 上一个元素选的是 - 号, 所以 S 增加了
        dfs_findTarget(nums, S + nums[i], i + 1, &res)

    }
    
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        
        if A.count < 3  {
            return 0
        }
        var res = 0
        var dp = [Int](repeating: 0, count: A.count)
        /**
         dp[i]表示以元素A[i]结尾的等差数列的个数
         如果[1,2,3,4,5,6]是一个等差数列，则
         以A[2]结尾的等差数列 [1,2,3]
         以A[3]结尾的等差数列 [1,2,3,4],[2,3,4]
         以A[4]结尾的等差数列 [1,2,3,4,5],[2,3,4,5],[3,4,5]
         以A[5]结尾的等差数列 [1,2,3,4,5,6],[2,3,4,5,6],[3,4,5,6],[4,5,6]
         所以可以看出转移方程: dp[i] = ap[i - 1] + 1
         */
        for i in 2..<A.count {
            if A[i] - A[i - 1] == A[i - 1] - A[i - 2] {
                //
                dp[i] = dp[i - 1] + 1
                res += dp[i]
            }
        }
        return res
        
    }
    
     func coinChange(_ coins: [Int], _ amount: Int) -> Int {
           
        if coins.count == 0 {
            return -1
        }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        // 0 需要 0的硬币
        dp[0] = 0
        for coin in coins {
            for i in coin...amount {
                // 假如: i - coin 合法, 只需要加上当前这一枚硬币即可
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] >= amount + 1 ? -1:dp[amount]
        
        
        
//           // 降序排序
//           let sorted_coins = coins.sorted(by: { $0 > $1 })
//           // 解
//           var res = Int.max
//           dfs_coinChange(sorted_coins, 0, amount, 0, &res)
//           return res == Int.max ? -1:res;
       }
       // index: 索引
       // amount: 剩余面额
       // count: 当前已经使用的硬币数
       // res: 输出
       func dfs_coinChange( _ coins:[Int], _ index: Int,_ amount: Int, _ count: Int, _ res: inout Int) {
           let coin = coins[index]
           if index == coins.count - 1 {
               if amount % coin == 0 {
                   res = min(res, count + amount / coin)
               }
           } else {
               var k = amount / coin
               while k >= 0 && (count + k) < res {
                   dfs_coinChange(coins, index + 1, amount - k * coin, count + k, &res)
                   k -= 1
               }
           }
       }
    
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count == 0 {
            return 0
        }
        var hold = Int.min
        var rest = 0
        var sold = 0
        for item in prices {
            let preSold = sold
            sold = hold + item
            hold = max(hold, rest - item)
            rest = max(preSold, rest)
        }
        return max(rest, sold)
    }
    
    // 打家劫舍
    func dp(_ nums: [Int]) -> [Int] {
        var dp = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            let n1 = i > 1 ? dp[i - 2] + nums[i] : nums[i]
            let n2 = i > 0 ? dp[i - 1] : 0
            dp[i] = max(n1, n2)
        }
        return dp
    }
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums.first!
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var arr1: [Int] = nums
        var arr2: [Int] = nums
        arr1.removeFirst()
        arr2.removeLast()
        
        let dp1 = dp(arr1)
        let dp2 = dp(arr2)
        return max(dp1[nums.count - 2], dp2[nums.count - 2])
    }
    
    func nthUglyNumber(_ n: Int) -> Int {
        
        if n <= 0 {
            return 0
        }
        var res = [1]
        var n1 = 0
        var n2 = 0
        var n3 = 0
        
        for _ in 1...n {
            let next1 = res[n1] * 2
            let next2 = res[n2] * 3
            let next3 = res[n3] * 5
            let minValue = min(next1, next2, next3)
            if minValue == next1 {
                n1 += 1
            }
            if minValue == next2 {
                n2 += 1
            }
            if minValue == next3 {
                n3 += 1
            }
            res.append(minValue)
        }
        return res[n - 1]
        
    }

    
    func isUgly(_ num: Int) -> Bool {
        
        var n = num
        while n != 1 {
            if n % 2 == 0 {
                n = n / 2
                continue
            } else if n % 3 == 0 {
                n = n / 3
                continue
            } else if n % 5 == 0 {
                n = n / 5
                continue
            } else {
                return false
            }

        }
        return true
    }
    
    func longesValidParentheses(_ s: String) -> Int {
        
        let strArr = Array(s)
        var stack = [Int]()
        var start = -1
        var res = 0
        for i in 0..<strArr.count {
            if strArr[i] == "(" {
                stack.append(i)
                
            } else {
                if stack.count == 0 {
                    start = i
                } else {
                    stack.removeLast()
                    if stack.count == 0 {
                        res = max(res, i - start)
                    } else {
                        res = max(res, i - stack.last!)
                    }
                }
            }
        }
        
        return res
    }
    
  
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        

        var dp = Array(repeating: false, count: s.count + 1)
        // 表示任意空字符穿是可以被分割的
        dp[0] = true
        
        let wordSet: Set<String> = Set<String>(wordDict)
        for i in 0..<dp.count {
            for j in 0..<i {
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                let subStr = String(s[start..<end])
                if dp[j] && wordSet.contains(subStr) {
                    print(subStr)
                    dp[i] = true
                    break
                }
            }
        }
        return dp.last!
    }
    
    // 是否是回文数
    func isPalindrome(_ s: [Character], _ j: Int, _ i: Int ) -> Bool {
        var a = j, b = i
        while a < b {
            if s[a] != s[b] {
                return false
            }
            a += 1
            b -= 1
        }
        return true
    }
    // 132 分割字符串
    func minCut(_ s: String) -> Int {
        
        let n = s.count
        let strArr = Array(s)
        // 初始DP
        var dp = Array(repeating: Int.max, count: n)
        for i in 0..<n {
        
            for j in 0..<i + 1 {
                
                if isPalindrome(strArr, j, i) {
                    dp[i] = j == 0 ? 0 : min(dp[i], dp[j - 1] + 1)
                }
            }
        }
        return dp[n - 1]

    }

    func dailyTemperatures3(_ T: [Int]) -> [Int] {
        
        // 单调栈
        let n = T.count
        var res = Array(repeating: 0, count: n)
        var stack = [Int]()
        var i = n - 1
        while i >= 0 {
            while stack.count > 0 && T[i] >= T[stack[0]] {
                stack.removeFirst()
            }
            stack.insert(i, at: 0)
            if stack.count > 1 {
                res[i] = stack[1] - i
            } else {
                res[i] = 0
            }
            i -= 1
        }
        return res
    }

  
    func dailyTemperatures2(_ T: [Int]) -> [Int] {
        
        // 反向遍历
        var res = Array(repeating: 0, count: T.count)
        res[T.count - 1] = 0
        var j = 0
        for i in stride(from: T.count - 2, through: 0, by: -1) {
            j = i + 1
            while j < T.count {
                if T[i] < T[j] {
                    res[i] = j - i
                    break;
                } else if (res[j] == 0) {
                    res[i] = 0
                    break
                } else {
                    j += res[j]
                }
            }
        }
        return res
        
    }
    // 739: 每日温度
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        
        // 暴力解法 会超时
        // 直接遍历找出最大值
        
        var res = Array(repeating: 0, count: T.count)
        for (i, item) in T.enumerated() {
            var num = 0
            for j in i + 1..<T.count {
                if T[j] > item {
                    num = j - i
                    break
                }
                
            }
            res[i] = num
        }
        
//        var res: [Int] = []
//        var num = 0
//        for (i, item) in T.enumerated() {
//            for j in i + 1..<T.count {
//                if T[j] > item {
//                    num = j - i
//                    break
//                } else {
//                    num = 0
//                }
//            }
//            // 最后一个肯定为0
//            if i == T.count - 1 {
//                num = 0
//            }
//            res.append(num)
//        }
        return res
    }
    
    // 84:柱状图中的最大矩形
    func lagersRectangleArea(_ heights: [Int]) -> Int {
        
        var res = [Int]()
        var next = 0
        for (index, item) in heights.enumerated() {
            
            for j in 0..<heights.count - 1 {
                let sub = heights[j]
                if item > sub {
                    
//                    res.append(item * j)
                } else {
//                    res.append(item * (j - index + 1))
                }
            }
        }
        
        return 0
    }
    
    // 42接雨水
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n <= 2 {
            return 0
        }
        var max_left = height[0]
        var left = 0
        var max_right = height[n - 1]
        var right = n - 1
        var res = 0
        for index in 1..<n - 1 {
            print(index)
            if max_left < max_right {
                if max_left > height[left + 1] {
                    res = res + max_left - height[left + 1]
                } else {
                    max_left = height[left + 1]
                }
                left += 1
            } else {
                if max_right > height[right - 1] {
                    res = res + max_right - height[right - 1]
                    
                } else {
                    max_right = height[right - 1]
                }
                right -= 1
            }
        }
        return res
    }
    // 三角形最短路径
    func minimumTotal2(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        var dp = triangle.last!
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
        }
        return dp[0]
    }
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
   
        guard triangle.count > 0 && triangle[0].count > 0 else {
            return 0
        }
        let m = triangle.count
        var dp = triangle[m - 1]
        var j = m - 2
        while j >= 0 {
            let subArr = triangle[j]
            for index in 0..<subArr.count {
                dp[index] = min(dp[index], dp[index + 1]) + subArr[index]
            }
            j -= 1
        }
        return dp[0]
    

//        guard triangle.count != 0 else {
//            return 0
//        }
//        var result = triangle.first!.first!
//        var index = 1
//        var middleIndex = 0
//        while index < triangle.count {
//            let subArr = triangle[index]
//            let oneNum = subArr[middleIndex]
//            let otherNum = subArr[middleIndex + 1]
//            if oneNum > otherNum {
//                middleIndex += 1
//                result += otherNum
//            } else {
//                result += oneNum
//            }
//            index += 1
//        }
//        return result
        
    }
    func isPalindrome3(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0 ) {
            return false
        }
        var res = 0
        var num = x
        while num != 0 {
            res = res * 10 + num % 10
            num /= 10
        }
        return res == x
    }
    
    func isPalindrome2(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var X = x
        var reverserNum: Int = 0
        while X > reverserNum {
            reverserNum = reverserNum * 10 + X % 10
            X /= 10
        }
        return reverserNum == X || (X == reverserNum / 10)
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        if x == 0 {
            return true
        }
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        let xStr = "\(x)"
        var reverseStr = ""
        for str in xStr.reversed()  {
            reverseStr.append(str)
        }
        return Int(reverseStr) == x
    }
    
    func reverse(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        let flag = x < 0 ? true : false
        let number = flag ? -x:x
        let numStr = "\(number)"
        var str = ""
        for num in numStr.reversed() {
            str.append("\(num)")
        }
        let max = Int32.max
        let min = Int32.min
       
        let res = flag ? -Int(str)!:Int(str)!
        if res > Int(max) || res < Int(min) {
            return 0
        }
        return res
    }
    
    func reverse2(_ x: Int) -> Int {
        var X = x
        let INT_MAX = pow(2.0, 31.0) - 1
        let INT_MIN = -pow(2.0, 31.0)
        var rev = 0
        var pop : (Int)
        while X != 0 {
            pop = X % 10
            X /= 10
            if (rev > Int(INT_MAX / 10) || (rev == Int(INT_MAX / 10) && pop > 7)) {
                return 0
            }
            if (rev < Int(INT_MIN / 10) || (rev == Int(INT_MIN / 10) && pop < -8)) {
                return 0
            }
            rev = rev * 10 + pop
        }
        return rev
    }
}

