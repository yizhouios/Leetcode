//
//  51.shu-zu-zhong-de-ni-xu-dui-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/24.
//

import Foundation

/*
 剑指 Offer 51. 数组中的逆序对 (困难)
 https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof/
 */

class Solution_Offer_51 {
    func reversePairs(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var nums = nums
        return inversePairsCount(&nums, 0, nums.count - 1)
    }
    
    func inversePairsCount(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        if start >= end {
            return 0
        }
        
        if end - start == 1 {
            if nums[end] >= nums[start] {
                return 0
            }
            nums.swapAt(start, end)
            return 1
        }
        
        let mid = start + (end - start) / 2
        let left = inversePairsCount(&nums, start, mid)
        let right = inversePairsCount(&nums, mid + 1, end)
        
        var sorted = [Int]()
        
        var i = mid
        var j = end
        var count = 0
        while i >= start && j >= (mid + 1) {
            let valueI = nums[i]
            let valueJ = nums[j]
            if valueI > valueJ {
                sorted.insert(valueI, at: 0)
                count += (j - mid)
                i -= 1
            } else {
                sorted.insert(valueJ, at: 0)
                j -= 1
            }
        }
        
        if i >= start {
            for index in stride(from: i, to: start - 1, by: -1) {
                sorted.insert(nums[index], at: 0)
            }
        }
        if j >= mid + 1 {
            for index in stride(from: j, to: mid, by: -1) {
                sorted.insert(nums[index], at: 0)
            }
        }
        
        for i in start...end {
            nums[i] = sorted[i - start]
        }
        
        return left + count + right
    }
    
    /*
     测试用例：
     1. 功能测试：未排序、递增排序、递减排序、包含重复数字
     2. 边界值测试：只有2个数字；只要1个数字
     3. 特殊输入测试：空数组
     */
    func test() {
        let tests = [
[7,5,6,4],
[1,2,3,4,5],
[5,4,3,2,1],
[5,4,3,2,1,1,2,3,4,5],
[1,2],
[2,1],
[1],
[],
            // Leetcode出错用例
[233,2000000001,234,2000000006,235,2000000003,236,2000000007,237,2000000002,2000000005,233,233,233,233,233,2000000004]
        ]
        for i in tests {
            print(reversePairs(i))
        }
    }
}
