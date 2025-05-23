//
//  198.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/22.
//

import Foundation

/*
 198. 打家劫舍 (中等)
 https://leetcode.cn/problems/house-robber/
 */

class Solution_198 {
    // MARK: - 动态规划
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        let count = nums.count
        // dp[i][0]表示第i个物品没有选时的最大金额
        // dp[i][1]表示第i个物品选择时的最大金额
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: count)
        dp[0][0] = 0
        dp[0][1] = nums[0]

        for i in 1..<count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1])
            dp[i][1] = nums[i] + dp[i - 1][0]
        }

        return max(dp[count - 1][0], dp[count - 1][1])
    }
    
    // MARK: - 动态规划（空间优化①）
    func rob_v2(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(dp[0], nums[1])

        for i in 2..<nums.count {
            dp[i] = max(nums[i] + dp[i - 2], dp[i - 1])
        }

        return dp[nums.count - 1]
    }

    // MARK: - 动态规划 (空间优化②。滚动数组思路，每间房屋的最高总金额只和该房屋的前两间房屋的最高总金额相关)
    func rob_v3(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        var first = nums[0]
        var second = max(first, nums[1])

        for i in 2..<nums.count {
            let newSecond = max(first + nums[i], second)
            first = second
            second = newSecond
        }

        return second
    }
}
