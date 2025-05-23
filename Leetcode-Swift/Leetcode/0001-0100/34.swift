//
//  34.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/29.
//

import Foundation

/*
 34. 在排序数组中查找元素的第一个和最后一个位置 (中等)
 https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 */

class Solution_34 {
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty {
            return [-1, -1]
        }

        // 寻找第一个等于目标值的索引
        let firstIndex = binarySearch(nums, target, true)
        if firstIndex == -1 {
            return [-1, -1]
        }

        // 寻找最后一个等于目标值的索引
        let lastIndex = binarySearch(nums, target, false)

        return [firstIndex, lastIndex]
    }

    func binarySearch(_ nums: [Int], _ target: Int, _ isFindFirst: Bool) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                if isFindFirst {
                    if mid == 0 || nums[mid - 1] != target {
                        return mid
                    } else {
                        high = mid - 1
                    }
                } else {
                    if mid == (nums.count - 1) || nums[mid + 1] != target {
                        return mid
                    } else {
                        low = mid + 1
                    }
                }
            } else if (nums[mid] > target) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return -1
    }
    
    func test() {
        assert(searchRange([1], 0) == [-1, -1])
        assert(searchRange([2,2], 3) == [-1,-1])
        assert(searchRange([5,7,7,8,8,10], 8) == [3, 4])
        assert(searchRange([5,7,7,8,8,10], 6) == [-1, -1])
        assert(searchRange([], 0) == [-1, -1])
        print("success")
    }
}
