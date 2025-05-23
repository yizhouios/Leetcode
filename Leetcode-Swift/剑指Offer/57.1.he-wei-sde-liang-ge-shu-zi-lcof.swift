//
//  57.1.he-wei-sde-liang-ge-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/29.
//

import Foundation

/*
 剑指 Offer 57. 和为s的两个数字 (简单)
 https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/
 */

class Solution_Offer_57_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        var left = 0
        var right = nums.count - 1
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                return [nums[left], nums[right]]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return []
    }
    
    /*
     测试用例：
     1. 功能：有和为target的；无和为taget的
     2. 特殊：空数组
     */
    func test() {
        let tests = [
            ([2,7,11,15], 9),
            ([10,26,30,31,47,60], 40),
            ([10,26,30,31,47,60], 100)
        ]
        
        for i in tests {
            print(twoSum(i.0, i.1))
        }
    }
}
