//
//  1143.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/27.
//

import Foundation

/*
 1143. 最长公共子序列 (中等)
 https://leetcode.cn/problems/longest-common-subsequence/
 */

class Solution_1143 {
    // MARK: - 动态规划
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty {
            return 0
        }
        if text1 == text2 {
            return text1.count
        }

        let text1 = Array(text1)
        let text2 = Array(text2)
        let m = text1.count
        let n = text2.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if text1[i - 1] == text2[j - 1] {
                    dp[i][j] = max(dp[i - 1][j - 1] + 1, dp[i - 1][j], dp[i][j - 1])
                } else {
                    dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
    
    // MARK: - 动态规划（优化）
    func longestCommonSubsequence_v2(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty {
            return 0
        }
        if text1 == text2 {
            return text1.count
        }

        let text1 = Array(text1)
        let text2 = Array(text2)
        let m = text1.count
        let n = text2.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if text1[i - 1] == text2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}
