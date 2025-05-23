//
//  17.04.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/10.
//

import Foundation

/*
 面试题 17.04. 消失的数字 (简单)
 https://leetcode.cn/problems/missing-number-lcci/
 */

class Solution_17_04 {
    // MARK: - 位运算
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var xorVal = 0
        for i in 1...nums.count {
            xorVal ^= i
            xorVal ^= nums[i - 1]
        }

        return xorVal
    }
    
    // MARK: - 数学
    func missingNumber_v2(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var sum1 = 0, sum2 = 0
        for i in 1...nums.count {
            sum1 += i
            sum2 += nums[i - 1]
        }

        return sum1 - sum2
    }
}
