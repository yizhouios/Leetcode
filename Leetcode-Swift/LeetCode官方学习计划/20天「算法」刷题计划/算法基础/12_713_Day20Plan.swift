//
//  12_713_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/26.
//

import Foundation

/*
 713. 乘积小于K的子数组 (中等)
 https://leetcode-cn.com/problems/subarray-product-less-than-k/
 */

class Solution_12_713_Day20Plan {
    /// 滑动窗口 (双指针)
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 {
            return 0
        }
        let len = nums.count
        var ans = 0, left = 0
        var product = 1
        for right in 0..<len {
            let val = nums[right]
            product *= val
            while product >= k {
                product /= nums[left]
                left += 1
            }
            ans += right - left + 1
        }
        
        return ans
    }
    
    func test() {
        print(numSubarrayProductLessThanK([1,1,1], 1))
        print(numSubarrayProductLessThanK([10,5,2,6], 100))
    }
}
