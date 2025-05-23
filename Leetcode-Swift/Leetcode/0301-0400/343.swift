//
//  343.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/10.
//

import Foundation

/*
 343. 整数拆分 (中等)
 https://leetcode.cn/problems/integer-break/
 */

class Solution_343 {
    // MARK: - 动态规划（爬楼梯思路）
    func integerBreak(_ n: Int) -> Int {
        if n <= 0 { return 0 }
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
