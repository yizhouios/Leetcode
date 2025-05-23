//
//  42.lian-xu-zi-shu-zu-de-zui-da-he-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/19.
//

import Foundation

/*
 剑指 Offer 42. 连续子数组的最大和 (简单)
 https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/
 */

class Solution_Offer_42 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var ans = nums[0]
        var curSum = Int.min
        for i in nums {
            if curSum < 0 {
                curSum = i
            } else {
                curSum += i
            }
            ans = max(ans, curSum)
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：全是正数、全是负数、正负相间
     2. 特殊输入测试：空数组、仅1个数
     */
    func test() {
        print(maxSubArray([1,2,3]))
        print(maxSubArray([-1,-2,-3]))
        print(maxSubArray([1,2,3,-5,10,-6,15]))
        print(maxSubArray([]))
        print(maxSubArray([1]))
        print(maxSubArray([-1]))
        
        // leetcode用例
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    }
}
