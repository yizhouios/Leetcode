//
//  53.2.que-shi-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/26.
//

import Foundation

/*
 剑指 Offer 53 - II. 0～n-1中缺失的数字 (简单)
 https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/
 */

class Solution_Offer_53_2 {
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        let count = nums.count
        var left = 0
        var right = count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let midValue = nums[mid]
            if midValue != mid {
                if mid == 0 || nums[mid - 1] == mid - 1 {
                    return mid
                }
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        if left == count {
            return count
        }
        
        return -1
    }
    
    func missingNumber_byself(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        var nums = nums
        let endIndex = nums.count - 1
        for (index, i) in nums.enumerated() {
            if index != i {
                if i <= endIndex {
                    nums.swapAt(i, index)
                }
            }
        }
        for (index, i) in nums.enumerated() {
            if index != i {
                return index
            }
        }
        
        // 如果没有缺失的，返回缺失的数字为数组的长度（即最大元素的下一个元素）
        return nums.count
    }
    
    /*
     测试用例：
     1. 功能测试：数组中没有缺失的数组；有缺失的数字
     2. 边界值测试：只有1个数字；缺失的数字在开头、结尾
     3. 特殊输入测试：空数组
     */
    func test() {
        let tests = [
            [0,1,2,3],
            [0,1,10,3],
            [0],
            [1],
            [10],
            [0,1,2,10],
            []
        ]
        for i in tests {
            print(missingNumber(i))
        }
    }
}
