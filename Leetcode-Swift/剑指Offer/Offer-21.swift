//
//  21.diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/7.
//

import Foundation

/*
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面 (简单)
 https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/
 */

class Solution_Offer_21 {
    
    func exchange(_ nums: [Int]) -> [Int] {
        return exchangeCore(nums, conditionFn: isOdd(_:))
    }
    
    func exchangeCore(_ nums: [Int], conditionFn: (Int) -> Bool) -> [Int] {
        var nums = nums
        var left = 0
        var right = nums.count - 1

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

        return nums
    }
    
    func isOdd(_ num: Int) -> Bool {
        return num & 1 == 1
    }
    
    /*
     测试用例：
     1. 功能测试：奇偶交替出现；所有偶数在奇数前面；所有奇数在偶数前面
     2. 特殊输入：空数组；仅1个数字
     */
    func test() {
        print(exchange([1,2,3,4,5,6]))
        print(exchange([2,4,6,1,2,3]))
        print(exchange([1,3,5,2,4,6]))
        print(exchange([]))
        print(exchange([1]))
        print(exchange([2]))
    }
}
