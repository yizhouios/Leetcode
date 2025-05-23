//
//  918.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/30.
//

import Foundation

/*
 918. 环形子数组的最大和 (中等)
 https://leetcode-cn.com/problems/maximum-sum-circular-subarray/
 */

class Solution_918 {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        let len = nums.count
        var cur = nums[0]
        var sum = cur
        var max = cur
        for i in 1..<len {
            let val = nums[i]
            sum += val
            cur = val + (cur > 0 ? cur : 0)
            max = max > cur ? max : cur
        }
        
        cur = nums[0]
        var min = 0
        var index = 1
        while index < (len - 1) {
            let val = nums[index]
            cur = val + (cur > 0 ? 0 : cur)
            min = min < cur ? min : cur
            
            index += 1
        }
        
        let circulMax = sum - min
        return max > circulMax ? max : circulMax
    }
    
    /*
     测试用例：
     1. 功能：全正、全负、最大数组和为环形组成的元素、最大数组和为非环形组成的元素
     2. 特殊：仅1个元素、空数组
     */
    func test() {
        print(maxSubarraySumCircular([1,-2,3,-2]))
        print(maxSubarraySumCircular([5,-3,5]))
        print(maxSubarraySumCircular([3,-1,2,-1]))
        print(maxSubarraySumCircular([3,-2,2,-3]))
        print(maxSubarraySumCircular([-2,-3,-1]))

        print(maxSubarraySumCircular([1]))
        print(maxSubarraySumCircular([1,2]))
        print(maxSubarraySumCircular([1,2,3]))

        print(maxSubarraySumCircular([-1]))
        print(maxSubarraySumCircular([-1,-2]))
        print(maxSubarraySumCircular([-3,-2,-1]))

        print(maxSubarraySumCircular([1,-2,3,-2,2]))
        print(maxSubarraySumCircular([-1,-2,5,-3,2]))

        print(maxSubarraySumCircular([-1]))
        print(maxSubarraySumCircular([0]))
        print(maxSubarraySumCircular([]))
        
        // Leetcode
        print(maxSubarraySumCircular([0,5,8,-9,9,-7,3,-2])) // 16
        print(maxSubarraySumCircular([-2,4,-5,4,-5,9,4])) // 15
        print(maxSubarraySumCircular([-5,-2,5,6,-2,-7,0,2,8])) // 14
        print(maxSubarraySumCircular([-2]))
    }
}
