//
//  215.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/26.
//

import Foundation

/*
 215. 数组中的第K个最大元素 (中等)
 https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
 */

class Solution_215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 参数校验
        let count = nums.count
        if count < k {
            return -1
        }

        var nums = nums
        var beginIndex = 0
        var endIndex = count - 1
        let targetIndex = k - 1

        // 寻找排序过程中的分区点
        var idx = partition(&nums, beginIndex, endIndex)
        while idx != targetIndex {
            if idx > targetIndex {
                endIndex = idx - 1
            } else {
                beginIndex = idx + 1
            }
            idx = partition(&nums, beginIndex, endIndex)
        }

        return nums[idx]
    }

    // 分区函数(双指针)
    func partition(_ nums: inout [Int], _ l: Int, _ r: Int) -> Int {
        var i = l
        var j = r - 1
        
        let referenceVal = nums[r]
        while i < j {
            while i < j && nums[i] >= referenceVal {
                i += 1
            }
            while i < j && nums[j] < referenceVal {
                j -= 1
            }
            if i < j {
                let tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp

                i += 1
                j -= 1
            }
        }

        if i == j {
            if nums[i] >= referenceVal {
                i += 1
            }
        }

        // 交换分区参考值
        let tmp = nums[i]
        nums[i] = nums[r]
        nums[r] = tmp

        return i
    }
}
