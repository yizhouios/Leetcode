//
//  38_673_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/6.
//

import Foundation

/*
 673. 最长递增子序列的个数 (中等)
 https://leetcode-cn.com/problems/number-of-longest-increasing-subsequence/
 */

class Solution_38_673_Day20Plan {
    /// 动态规划
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        let len = nums.count
        var lengths = [Int](repeating: 0, count: len)
        var counts = [Int](repeating: 1, count: len)

        for j in 0..<len {
            for i in 0..<j {
                if nums[j] > nums[i] {
                    if lengths[i] >= lengths[j] {
                        lengths[j] = lengths[i] + 1
                        counts[j] = counts[i]
                    } else if (lengths[i] + 1 == lengths[j]) {
                        counts[j] += counts[i]
                    }
                }
            }
        }
        
        var ans = 0
        let maxLen = lengths.max()!
        for i in 0..<len {
            if lengths[i] == maxLen {
                ans += counts[i]
            }
        }
        
        return ans
    }
    
    func test() {
        print(findNumberOfLIS([1,3,5,4,7]))
        print(findNumberOfLIS([2,2,2,2,2]))
    }
}
