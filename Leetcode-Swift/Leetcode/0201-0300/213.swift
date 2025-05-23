//
//  213.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/22.
//

import Foundation

/*
 213. 打家劫舍 II (中等)
 https://leetcode.cn/problems/house-robber-ii/
 */

class Solution_213 {
    // MARK: - 动态规划（根据第0间房屋是否偷，来对剩余的房间进行打家劫舍I的操作）
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }
        if nums.count == 2 { return max(nums[0], nums[1]) }

        let count = nums.count
        // 第0个不偷时，偷窃1~count-1
        let ans1 = robRange(nums, 1, count - 1)
        // 第0个偷时，偷窃2~count-2
        let ans2 = nums[0] + robRange(nums, 2, count - 2)

        return max(ans1, ans2)
    }

    func robRange(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let count = nums.count
        // dp[i][0]表示第i个物品没有选时的最大金额
        // dp[i][1]表示第i个物品选择时的最大金额
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: count)
        dp[start][0] = 0
        dp[start][1] = nums[start]

        for i in stride(from: start, through: end, by: 1) {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1])
            dp[i][1] = nums[i] + dp[i - 1][0]
        }

        return max(dp[end][0], dp[end][1])
    }
}
