//
//  32_62_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/3.
//

import Foundation

/*
 62. 不同路径 (中等)
 https://leetcode-cn.com/problems/unique-paths/
 */

class Solution_32_62_Day20Plan {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            dp[i][0] = 1
        }
        for i in 0..<n {
            dp[0][i] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        return dp[m - 1][n - 1]
    }
    
    func test() {
        print(uniquePaths(3, 7))
        print(uniquePaths(3, 2))
        print(uniquePaths(3, 3))
    }
}
