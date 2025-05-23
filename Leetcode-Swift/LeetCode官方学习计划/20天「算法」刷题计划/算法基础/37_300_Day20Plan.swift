//
//  37_300_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/6.
//

import Foundation

/*
 300. 最长递增子序列 (中等)
 https://leetcode-cn.com/problems/longest-increasing-subsequence/
 */

class Solution_37_300_Day20Plan {
    /// 动态规划
    /// 时间复杂度：O(n^2)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        let len = nums.count
        var dp = [Int](repeating: 1, count: len)
        for i in 0..<len {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max()!
    }
    
    func test() {
//        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
//        print(lengthOfLIS([0,1,0,3,2,3]))
//        print(lengthOfLIS([7,7,7,7,7,7,7]))
        
        print(lengthOfLIS([1,3,6,7,9,4,10,5,6]))
    }
}
