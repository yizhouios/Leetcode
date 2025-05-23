//
//  63.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/21.
//

import Foundation

/*
 63. 不同路径 II (中等)
 https://leetcode.cn/problems/unique-paths-ii/
 */

class Solution_63 {
    // MARK: - 动态规划
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty || obstacleGrid[0].isEmpty {
            return 0
        }

        if obstacleGrid[0][0] == 1 {
            return 0
        }

        let rows = obstacleGrid.count
        let cols = obstacleGrid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        dp[0][0] = 1

        for i in 1..<rows {
            if obstacleGrid[i][0] == 1 {
                break
            }
            dp[i][0] = 1
        }
        for j in 1..<cols {
            if obstacleGrid[0][j] == 1 {
                break
            }
            dp[0][j] = 1
        }

        for i in 1..<rows {
            for j in 1..<cols {
                if obstacleGrid[i][j] == 1 {
                    continue
                }

                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }

        return dp[rows - 1][cols - 1]
    }
}
