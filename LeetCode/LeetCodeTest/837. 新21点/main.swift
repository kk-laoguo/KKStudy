//
//  main.swift
//  837. 新21点
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.


import Foundation

class Solution {
    func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
      
//        var dp = [Double](repeating: 0.0, count: K + W)
        var dp: [Double] = Array(repeating: 0.0, count: K + W)

        var sum: Double = 0
        for i in K..<(K + W) {
            dp[i] = i <= N ? 1:0
            sum += dp[i]
        }
        for i in (0..<K).reversed() {
            dp[i] = sum/Double(W)
            sum = sum - dp[i + W] + dp[i]
        }
         
        return dp[0]
        
        
    }
}
let res = Solution().new21Game(6, 1, 10)
print(res)
/*
class Solution {
    public double new21Game(int N, int K, int W) {
        // 先判断 K - 1 + W 是否在 N 的里面，如果在的话，说明肯定能赢得游戏，返回 1.0，也就是 100%
        if (N - K + 1 >= W) {
            return 1.0;
        }
        double[] dp = new double[K + W];
        // 将能赢得游戏的点数的概率设置为 1
        for (int i = K; i <= N; i++) {
            dp[i] = 1.0;
        }
        // 计算K + W 这几个点数的概率和
        double sumProb = N - K + 1;
        // 从 K - 1 开始计算，
        for (int i = K - 1; i >= 0; i--) {
            // 点数为 i 的赢得游戏的概率为 i + 1 ~ i + W 的概率和除以 W
            dp[i] = sumProb / W;
            sumProb = sumProb - dp[i + W] + dp[i];
        }

        return dp[0];
    }
}

作者：jamie14
链接：https://leetcode-cn.com/problems/new-21-game/solution/javani-xiang-dong-tai-gui-hua-jie-jue-shuang-100-b/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/
