//
//  41_72_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/8.
//

import Foundation

/*
 72. 编辑距离 (困难)
 https://leetcode-cn.com/problems/edit-distance/
 */

class Solution_41_72_Day20Plan {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        let word1 = Array(word1)
        let word2 = Array(word2)
        
        if m * n == 0 {
            return m + n
        }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m {
            dp[i][0] = i
        }
        for j in 0...n {
            dp[0][j] = j
        }
        
        for i in 1...m {
            for j in 1...n {
                let left = dp[i][j - 1] + 1
                let up = dp[i - 1][j] + 1
                var leftUp = dp[i - 1][j - 1]
                if word1[i - 1] != word2[j - 1] {
                    leftUp += 1
                }
                dp[i][j] = min(left, up, leftUp)
            }
        }
        
        return dp[m][n]
    }
    
    func test() {
        print(minDistance("horse", "ros"))
        print(minDistance("intention", "execution"))
    }
}
