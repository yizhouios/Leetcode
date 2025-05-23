//
//  152.maximum-product-subarray.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/20.
//

import Foundation

/*
 152. 乘积最大子数组 (中等)
 https://leetcode-cn.com/problems/maximum-product-subarray/
 */

class Solution152 {
    /// 针对下面的算法进行空间优化
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var ans = nums[0]
        var dpMax = ans
        var dpMin = ans
        for i in 1..<nums.count {
            let tmpDpMax = dpMax, tmpDpMin = dpMin
            dpMax = max(nums[i], tmpDpMax * nums[i], tmpDpMin * nums[i])
            dpMin = min(nums[i], tmpDpMin * nums[i], tmpDpMax * nums[i])
            ans = max(dpMax, ans)
        }
        return ans
    }
    
    func maxProduct_old(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var dpMax = [Int](repeating: 0, count: nums.count)
        var dpMin = [Int](repeating: 0, count: nums.count)
        dpMax[0] = nums[0]
        dpMin[0] = nums[0]
        var ans = nums[0]
        for i in 1..<nums.count {
            dpMax[i] = max(nums[i], dpMax[i - 1] * nums[i], dpMin[i - 1] * nums[i])
            dpMin[i] = min(nums[i], dpMin[i - 1] * nums[i], dpMax[i - 1] * nums[i])
            ans = max(dpMax[i], ans)
        }
        return ans
    }
    
    /*
     测试用例：
     1. 最大子数组为1个元素：在最左侧；中间；最后侧
     2. 最大子数组有多个元素：在最左侧；中间；最后侧
     3. 最大子数组为负数、正数、0
     4. 空数组；仅1个元素
     */
    func test() {
        print(maxProduct([2,3,-2,4]))
        print(maxProduct([-2,0,-1]))
        
        print(maxProduct([10,-1,1,-1,5]))
        print(maxProduct([-1,1,-2,3,-5,10]))
        print(maxProduct([-1,2,-4,10,-5,6]))
        
        print(maxProduct([10,5,-1,2,-3,4]))
        print(maxProduct([-1,2,-3,5,10,-3,6]))
        print(maxProduct([-1,2,3,-5,10,5]))
        
        print(maxProduct([-1]))
        print(maxProduct([0,0,10,0,0]))
        print(maxProduct([-1,0,-10,0,0]))
        
        print(maxProduct([]))
        print(maxProduct([6]))
    
        // 未过用例
        // 1. [-2,3,-4]
        print(maxProduct([-2,3,-4]))
    }
}
