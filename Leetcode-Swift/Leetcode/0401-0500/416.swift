//
//  416.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/16.
//

import Foundation

/*
 416. 分割等和子集 (中等)
 https://leetcode.cn/problems/partition-equal-subset-sum/
 */

class Solution_416 {
    // MARK: - 0-1背包问题，是否能装满背包
    func canPartition(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }

        let sum = nums.reduce(0, +)
        if sum & 1 == 1 {
            return false
        }

        let target = sum / 2
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: target + 1),
                              count: nums.count)
        dp[0][0] = true
        if nums[0] <= target {
            dp[0][nums[0]] = true
        }

        for i in 1..<nums.count {
            let num = nums[i]
            for j in 0...target {
                if j < num {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - num]
                }
            }
        }

        return dp[nums.count - 1][target]
    }
    
    // MARK: - 0-1背包问题，是否能装满背包（优化）
    func canPartition_v2(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }

        var sum = nums.reduce(0, +)
        if sum & 1 == 1 {
            return false
        }
        
        sum /= 2
        
        var dp = [Bool](repeating: false, count: sum + 1)
        dp[0] = true

        for num in nums {
            if (dp.count >= num) {
                for i in (num..<dp.count).reversed() {
                    dp[i] = dp[i] || dp[i - num]
                    if i == sum && dp[sum] {
                        return true
                    }
                }
            }
        }

        return false
    }
}
