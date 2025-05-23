//
//  120.triangle.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/19.
//

import Foundation

/*
 120. 三角形最小路径和 (中等)
 https://leetcode-cn.com/problems/triangle/
 */

class Solution_120 {
    // MARK: - 动态规划
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.isEmpty {
            return 0
        }

        var dp = triangle
        let rows = dp.count

        for i in 1..<rows {
            dp[i][0] = triangle[i][0] + dp[i - 1][0]
            for j in 1..<i {
                dp[i][j] = triangle[i][j] +  min(dp[i - 1][j - 1], dp[i - 1][j])
            }
            dp[i][i] = triangle[i][i] + dp[i - 1][i - 1]
        }

        var ans = dp[rows - 1][0]
        dp[rows - 1].forEach { i in
            ans = min(ans, i)
        }

        return ans
    }
    
    // MARK: - 动态规划（优化）
    func minimumTotal_v2(_ triangle: [[Int]]) -> Int {
        if triangle.isEmpty {
            return 0
        }

        let count = triangle.count
        var dp = Array(repeating: 0, count: count + 1)

        // 思路：三角形倒过来遍历
        for i in stride(from: count - 1, through: 0, by: -1) {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
        }

        return dp[0]
    }
}
