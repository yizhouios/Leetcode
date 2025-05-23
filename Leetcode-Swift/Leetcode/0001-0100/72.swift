//
//  72.edit-distance.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/22.
//

import Foundation

/*
 72. 编辑距离 (困难)
 https://leetcode-cn.com/problems/edit-distance/
 */

class Solution_72 {
    // MARK: - 动态规划
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty {
            return word2.count
        }
        if word2.isEmpty {
            return word1.count
        }

        let words1 = Array(word1)
        let words2 = Array(word2)
        let m = word1.count
        let n = word2.count

        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m {
            dp[i][0] = i
        }
        for j in 0...n {
            dp[0][j] = j
        }

        for i in 1...m {
            for j in 1...n {
                let up = dp[i - 1][j] + 1
                let left = dp[i][j - 1] + 1
                var leftUp = dp[i - 1][j - 1]
                if words1[i - 1] != words2[j - 1] {
                    leftUp += 1
                }
                dp[i][j] = min(up, left, leftUp)
            }
        }

        return dp[m][n]
    }
}
