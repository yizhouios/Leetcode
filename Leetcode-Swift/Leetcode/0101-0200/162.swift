//
//  162.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/30.
//

import Foundation

/*
 162. 寻找峰值 (中等)
 https://leetcode-cn.com/problems/find-peak-element/
 */

class Solution_162 {
    func findPeakElement(_ nums: [Int]) -> Int {
        // 特殊情况判断: 如果只有1个元素，由于nums[-1]代表负无穷，那么0索引就是峰值
        if nums.count == 1 {
            return 0
        }

        var low = 0
        var high = nums.count - 1
        let endIndex = high

        while low <= high {
            let mid = low + (high - low) / 2

            if mid == 0 { // 边界值0
                if nums[mid] > nums[mid + 1] {
                    return mid
                } else {
                    low = mid + 1
                }
            } else if mid == endIndex { // 边界值 nums.count - 1
                if nums[mid] > nums[mid - 1] {
                    return mid
                } else {
                    high = mid - 1
                }
            } else if (nums[mid] > nums[mid - 1]) && (nums[mid] > nums[mid + 1]) {
                return mid
            } else if (nums[mid] > nums[mid - 1]) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return -1
    }

    // 迭代二分查找
    func findPeakElement_1(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = l + (r - l) / 2
            if nums[m] > nums[m + 1] {
                r = m
            } else {
                l = m + 1
            }
        }
        
        return l
    }
    
    func test() {
        print(findPeakElement([1,2,3,1]))
        print(findPeakElement([1,2,1,3,5,6,4]))
    }
}
