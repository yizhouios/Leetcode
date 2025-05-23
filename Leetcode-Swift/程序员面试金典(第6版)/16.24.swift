//
//  16.24.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/29.
//

import Foundation

/*
 面试题 16.24. 数对和 (中等)
 https://leetcode.cn/problems/pairs-with-sum-lcci/
 */

class Solution_16_24 {
    func pairSums(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        let nums = nums.sorted()
        var left = 0
        var right = nums.count - 1
        var ans = [[Int]]()

        while left < right {
            let leftVal = nums[left]
            let rightVal = nums[right]
            let sum = leftVal + rightVal

            if sum == target {
                ans.append([leftVal, rightVal])
                left += 1
                right -= 1
            } else if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            }
        }

        return ans
    }
}
