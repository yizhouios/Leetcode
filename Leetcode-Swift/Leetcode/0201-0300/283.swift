//
//  283.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/1.
//

import Foundation

/*
 283. 移动零 (简单)
 https://leetcode.cn/problems/move-zeroes/
 */

class Solution_283 {
    // MARK: - 单指针
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(left, i)
                left += 1
            }
        }
    }
    
    // MARK: - 双指针
    func moveZeroes_v2(_ nums: inout [Int]) {
        var left = 0
        var right = 0
        
        while right < nums.count {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
            
            right += 1
        }
    }
}
