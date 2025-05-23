//
//  40_583_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/8.
//

import Foundation

/*
 583. 两个字符串的删除操作 (中等)
 https://leetcode-cn.com/problems/delete-operation-for-two-strings/
 */

class Solution_40_583_Day20Plan {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty {
            return word2.count
        }
        
        if word2.isEmpty {
            return word1.count
        }
        
        let word1 = Array(word1)
        let word2 = Array(word2)
        let m = word1.count
        let n = word2.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if word1[i - 1] == word2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return m + n - 2 * dp[m][n]
    }
    
    func test() {
        print(minDistance("abc", "abe"))
    }
}
