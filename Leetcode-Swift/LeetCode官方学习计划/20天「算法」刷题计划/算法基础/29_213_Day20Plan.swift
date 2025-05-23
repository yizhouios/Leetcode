//
//  29_213_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/2.
//

import Foundation

/*
 213. 打家劫舍 II (中等)
 https://leetcode-cn.com/problems/house-robber-ii/
 */

class Solution_29_213_Day20Plan {
    /// 动态规划（max(去头，去尾)）
    func rob(_ nums: [Int]) -> Int {
        func robRange(_ begin: Int, _ end: Int) -> Int {
            var first = nums[begin]
            var second = max(nums[begin], nums[begin + 1])
            var index = begin + 2
            while index <= end {
                let newSecond = max(second, nums[index] + first)
                first = second
                second = newSecond
                
                index += 1
            }
            return second
        }
        
        let len = nums.count
        if len == 1 {
            return nums[0]
        } else if len == 2 {
            return max(nums[0], nums[1])
        } else {
            return max(robRange(0, len - 2), robRange(1, len - 1))
        }
    }
    
    func test() {
        print(rob([2,3,2]))
        print(rob([1,2,3,1]))
        print(rob([0]))
        print(rob([1,2]))
    }
}
