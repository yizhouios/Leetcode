//
//  53.zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/25.
//

import Foundation

/*
 剑指 Offer 53 - I. 在排序数组中查找数字 I (简单)
 https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
 
 本题与主站 34 题相同（仅返回值不同）：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 */

class Solution_Offer_53_1 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        let count = nums.count
        var start = 0
        var end = count - 1
        var findIndex = -1
        
        while start <= end {
            let mid = start + (end - start) / 2
            let value = nums[mid]
            if value == target {
                findIndex = mid
                break
            } else if (value > target) {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        if findIndex != -1 {
            var left = findIndex
            var right = findIndex
            while left > 0 {
                if nums[left - 1] == target {
                    left -= 1
                } else {
                    break
                }
            }
            while right < count - 1 {
                if nums[right + 1] == target {
                    right += 1
                } else {
                    break
                }
            }
            
            return right - left + 1
        }
        
        return 0
    }
    
    /*
     测试用例：
     1. 功能测试：target存在数组中（出现1次/多次）；target不在数组中
     2. 边界值测试：数组中只有1个数字；taret为最小值或最大值
     3. 特殊输入测试：空数组
     */
    func test() {
        let tests = [
            ([1,22,33,33,44,55], 55),
            ([1,22,33,33,44,55], 33),
            ([1,22,33,33,44,55], 66),
            ([1,22,33,33,44,55], 1),
            ([1,22,33,33,44,55,88], 88),
            ([11], 11)
        ]
        for i in tests {
            print(search(i.0, i.1))
        }
    }
}
