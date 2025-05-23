//
//  42.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/19.
//

import Foundation

/*
 42. 接雨水 (困难)
 https://leetcode-cn.com/problems/trapping-rain-water/
 */

class Solution_42 {
    // MARK: - 前缀后缀统计（1个数组）
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }

        let count = height.count
        var leftMaxHeights = [Int](repeating: 0, count: count)
        leftMaxHeights[0] = height[0]
        var ans = 0
        
        var pre = height[0]
        for i in 1..<count {
            pre = max(pre, height[i])
            leftMaxHeights[i] = pre
        }

        pre = height[count - 1]
        for i in (0..<(count - 1)).reversed() {
            pre = max(pre, height[i])
            ans = ans + (min(leftMaxHeights[i], pre) - height[i])
        }

        return ans
    }
    
    // MARK: - 前缀后缀统计（2个数组）
    func trap_v2(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }

        let count = height.count
        
        var leftMaxHeights = [Int](repeating: 0, count: count)
        var maxHeight = 0
        for i in 0..<count {
            maxHeight = max(maxHeight, height[i])
            leftMaxHeights[i] = maxHeight
        }

        var rightMaxHeights = [Int](repeating: 0, count: count)
        maxHeight = 0
        for i in (0..<count).reversed() {
            maxHeight = max(maxHeight, height[i])
            rightMaxHeights[i] = maxHeight
        }
        
        var ans = 0
        for i in 0..<count {
            ans += (min(leftMaxHeights[i], rightMaxHeights[i]) - height[i])
        }

        return ans
    }
}
