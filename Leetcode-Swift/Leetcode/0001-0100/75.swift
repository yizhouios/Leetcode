//
//  75.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/26.
//

import Foundation

/*
 75. 颜色分类 (中等)
 https://leetcode-cn.com/problems/sort-colors/
 */

class Solution_75 {
    // MARK: - 单指针
    func sortColors(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }
        
        var ptr = 0
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                nums.swapAt(ptr, i)
                ptr += 1
            }
        }
        
        for i in ptr..<nums.count {
            if nums[i] == 1 {
                nums.swapAt(ptr, i)
                ptr += 1
            }
        }
    }
    
    // MARK: - 双指针 - 都从头开始（一次循环）
    func sortColors_v2(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }
        
        var p0 = 0, p1 = 0
        
        // 参考示例：[0,0,1,1,2,0]
        for i in 0..<nums.count {
            if nums[i] == 1 {
                nums.swapAt(p1, i)
                p1 += 1
            } else if (nums[i] == 0) {
                nums.swapAt(i, p0)

                if p0 < p1 {
                    nums.swapAt(i, p1)
                }
                
                p0 += 1
                p1 += 1
            }
        }
    }
    
    // MARK: - 双指针 - 一头一尾（一次循环）
    func sortColors_v3(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }
        
        var p0 = 0, p2 = nums.count - 1
        
        var i = 0
        while i <= p2 {
            while i <= p2 && (nums[i] == 2) {
                nums.swapAt(i, p2)
                p2 -= 1
            }
            
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                p0 += 1
            }
            
            i += 1
        }
    }
    
    // MARK: - 双指针（两次循环）
    func sortColors_v4(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }

        var partition = sortColorsCore(&nums, 0, nums.count - 1) { $0 == 0 }
        // 添加下面的代码为了应对某种情况，如：[1,0,0,2,2]。经过上面排序后，[0,0,1,2,2]，partition = 1
        if nums[partition] == 0 {
            partition += 1
        }
        let _ = sortColorsCore(&nums, partition, nums.count - 1) { $0 == 1 }
    }

    func sortColorsCore(_ nums: inout [Int], _ left: Int, _ right: Int, _ conditionFn: (Int) -> Bool) -> Int {
        var left = left
        var right = right

        while left < right {
            if conditionFn(nums[left]) {
                left += 1
                continue
            }
            if !conditionFn(nums[right]) {
                right -= 1
                continue
            }
            
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }

        return left
    }
}
