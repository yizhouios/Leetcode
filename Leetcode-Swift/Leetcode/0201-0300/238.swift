//
//  238.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/7.
//

import Foundation

/*
 238. 除自身以外数组的乘积 (中等)
 https://leetcode.cn/problems/product-of-array-except-self/
 */

class Solution_238 {
    // MARK: 前缀后缀统计（空间复杂度O(1)）
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        if nums.isEmpty {
            return []
        }

        let count = nums.count
        var ans = [Int](repeating: 1, count: count)

        var product = nums[0]
        for i in 1..<count {
            ans[i] = product
            product *= nums[i]
        }

        product = nums[count - 1]
        for i in (0..<(count - 1)).reversed() {
            ans[i] *= product
            product *= nums[i]
        }

        return ans
    }
}
