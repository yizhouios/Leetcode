//
//  70.climbing-stairs.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/19.
//

import Foundation

/*
 70. 爬楼梯 (简单)
 https://leetcode-cn.com/problems/climbing-stairs/
 */

class Solution_70 {
    // MARK: - 动态规划
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2

        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }

        return dp[n]
    }
    
    // MARK: - 动态规划（优化）
    func climbStairs_v2(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var f1 = 1
        var f2 = 2
        
        for _ in 3...n {
            let newF2 = f1 + f2
            f1 = f2
            f2 = newF2
        }

        return f2
    }
}
