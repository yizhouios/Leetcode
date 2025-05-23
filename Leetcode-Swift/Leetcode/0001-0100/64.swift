//
//  64.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/20.
//

import Foundation

/*
 64. 最小路径和 (中等)
 https://leetcode.cn/problems/minimum-path-sum/
 */

class Solution_64 {
    // MARK: - 动态规划
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }

        let rows = grid.count
        let cols = grid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        dp[0][0] = grid[0][0]

        for row in 1..<rows {
            dp[row][0] = grid[row][0] + dp[row - 1][0]
        }
        for col in 1..<cols {
            dp[0][col] = grid[0][col] + dp[0][col - 1]
        }

        for i in 1..<rows {
            for j in 1..<cols {
                dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
            }
        }

        return dp[rows - 1][cols - 1]
    }
}
