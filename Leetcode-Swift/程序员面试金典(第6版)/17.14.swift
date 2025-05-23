//
//  17.14.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/26.
//

import Foundation

/*
 面试题 17.14. 最小K个数 (中等)
 https://leetcode-cn.com/problems/smallest-k-lcci/
 */

class Solution_Jindian_1714 {
    func smallestK(_ arr: [Int], _ k: Int) -> [Int] {
        // 参数校验
        if arr.count < k {
            return []
        }
        if k <= 0 {
            return []
        }

        var arr = arr
        let count = arr.count
        var beginIndex = 0
        var endIndex = count - 1
        let targetIndex = k - 1

        var idx = partition(&arr, beginIndex, endIndex)
        while idx != targetIndex {
            if targetIndex < idx {
                endIndex = idx - 1
            } else {
                beginIndex = idx + 1
            }
            idx = partition(&arr, beginIndex, endIndex)
        }

        return Array(arr[0...idx])
    }

    // 分区函数
    func partition(_ nums: inout [Int], _ l: Int, _ r: Int) -> Int {
        var i = l
        var j = r - 1

        let referenceVal = nums[r]
        while i < j {
            while i < j && nums[i] < referenceVal {
                i += 1
            }
            while i < j && nums[j] >= referenceVal {
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

        // i和j相等，需要判断i所在的值是否大于参考值，如果不大于，i需要后移1个位置
        // 示例：i = j = 0, referenceVal = 4, [1,4]
        if i == j {
            if nums[i] <= referenceVal {
                i += 1
            }
        }

        // 将参考值交换到中间的位置
        let tmp = nums[i]
        nums[i] = nums[r]
        nums[r] = tmp

        return i
    }
}
