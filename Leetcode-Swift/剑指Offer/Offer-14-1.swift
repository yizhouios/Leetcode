//
//  14.jian-sheng-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 14- I. 剪绳子 (中等)
 https://leetcode-cn.com/problems/jian-sheng-zi-lcof/
 */

class Solution_Offer_14_1 {
    // MARK: - 动态规划（爬楼梯思路）
    func cuttingRope(_ n: Int) -> Int {
        if n == 1 || n == 2 { return 1 }
        if n == 3 { return 2 }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        
        for i in 1...n {
            for j in 1...i {
                dp[i] = max(dp[i], j * dp[i - j])
            }
        }

        return dp[n]
    }
}
