//
//  57.2.he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/29.
//

import Foundation

/*
 剑指 Offer 57 - II. 和为s的连续正数序列 (简单)
 https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/
 */

class Solution_Offer_57_2 {
    // MARK: - 滑动窗口（双指针）
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        if target < 3 {
            return []
        }

        var left = 1
        var right = 2
        var sum = 3
        var ans = [[Int]]()

        while left < right {
            if sum == target {
                ans.append(Array(left...right))

                // 同时移动两个指针
                sum -= left
                left += 1
                right += 1
                sum += right
            } else if sum > target {
                sum -= left
                left += 1
            } else {
                right += 1
                sum += right
            }
        }

        return ans
    }
}
