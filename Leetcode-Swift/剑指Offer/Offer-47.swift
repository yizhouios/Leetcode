//
//  47.li-wu-de-zui-da-jie-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/22.
//

import Foundation

/*
 剑指 Offer 47. 礼物的最大价值 (中等)
 https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
 */

class Solution_Offer_47 {
    // MARK: - 动态规划
    func maxValue(_ grid: [[Int]]) -> Int {
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
                dp[i][j] = grid[i][j] + max(dp[i - 1][j], dp[i][j - 1])
            }
        }

        return dp[rows - 1][cols - 1]
    }
    
    // MARK: - 动态规划（优化）
    func maxValue_v2(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }

        let rows = grid.count
        let cols = grid[0].count
        var dp = [Int](repeating: 0, count: cols + 1)
        
        for i in 0...(rows - 1) {
            for j in 1...cols {
                dp[j] = grid[i][j - 1] + max(dp[j - 1], dp[j])
            }
        }

        return dp[cols]
    }
}
