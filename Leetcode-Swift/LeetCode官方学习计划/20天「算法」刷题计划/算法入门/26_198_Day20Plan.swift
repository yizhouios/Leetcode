//
//  198_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/19.
//

import Foundation

/*
 198. 打家劫舍 (中等)
 https://leetcode-cn.com/problems/house-robber/
 */

class Solution_198_Day20Plan {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        let len = nums.count
        if len == 1 {
            return nums[0]
        }
        
        var dp = [Int](repeating: 0, count: len + 1)
        dp[1] = nums[0]
        for i in 2...len {
            dp[i] = max(dp[i - 2] + nums[i - 1], dp[i - 1])
        }
        
        return dp[len]
    }
    
    func test() {
        print(rob([10]))
        print(rob([1,2]))
        print(rob([1,2,3,1]))
        print(rob([2,7,9,3,1]))
    }
}
