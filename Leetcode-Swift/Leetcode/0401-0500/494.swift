//
//  494.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/17.
//

import Foundation

/*
 494. 目标和 (中等)
 https://leetcode.cn/problems/target-sum/
 */

class Solution_494 {
    // MARK: - 0-1背包问题，所装物品总重量为target，有多少种装发
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }

        let sum = nums.reduce(0) { pre, i in
            return pre + abs(i)
        }
        if (target > sum) || (target < -sum) {
            return 0
        }

        let allSums = sum * 2 + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: allSums), count: nums.count)

        /*
        这种写法提交报错，如果nums[0]是0的情况下，在加和减的情况下都是0，因此应该是2次
        dp[0][sum + nums[0]] = 1
        dp[0][sum + (-nums[0])] = 1
        */
        dp[0][sum + nums[0]] += 1
        dp[0][sum + (-nums[0])] += 1

        for i in 1..<nums.count {
            for j in 0..<allSums {
                if (j - nums[i]) >= 0 && (j - nums[i] < allSums) {
                    dp[i][j] = dp[i - 1][j - nums[i]]
                }
                if (j + nums[i] >= 0) && (j + nums[i] < allSums) {
                    dp[i][j] += dp[i - 1][j + nums[i]]
                }
            }
        }

        return dp[nums.count - 1][target + sum]
    }
}
