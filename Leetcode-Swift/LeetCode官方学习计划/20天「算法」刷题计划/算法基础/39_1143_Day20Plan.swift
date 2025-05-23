//
//  39_1143_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/8.
//

import Foundation

/*
 1143. 最长公共子序列 (中等)
 https://leetcode-cn.com/problems/longest-common-subsequence/
 */

class Solution_39_1143_Day20Plan {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty {
            return 0
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
    
    func test() {
        print(longestCommonSubsequence("abcde", "abe"))
    }
}
