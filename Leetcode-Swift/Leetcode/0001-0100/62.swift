//
//  62.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/21.
//

import Foundation

/*
 62. 不同路径 (中等)
 https://leetcode.cn/problems/unique-paths/
 */

class Solution_62 {
    // MARK: - 动态规划
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m <= 0 || n <= 0 {
            return 0
        }

        var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)

        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }

        return dp[m - 1][n - 1]
    }
}
