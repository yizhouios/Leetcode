//
//  55.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 55. 跳跃游戏 （中等）
 https://leetcode-cn.com/problems/jump-game/
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let len = nums.count
        var rightmost = 0
        for i in 0..<len {
            if i <= rightmost {
                rightmost = max(rightmost, i + nums[i])
                if rightmost >= len - 1 {
                    return true
                }
            }
        }
        
        return false
    }
    
    func canJump_old(_ nums: [Int]) -> Bool {
        // 参数校验
        if nums.isEmpty {
            return false
        }
        
        // 特殊情况
        if nums.count == 1 {
            return true
        }
        
        let len = nums.count
        var dp = [Int](repeating: 0, count: len)
        dp[0] = 1
        
        for i in 0..<len {
            if dp[i] == 0 {
                break
            }
            if nums[i] == 0 {
                continue
            }
            if i + nums[i] >= len - 1 {
                return true
            }
            for j in 1...nums[i] {
                dp[i + j] = 1
            }
        }
        
        return dp[len - 1] == 1
    }
}
