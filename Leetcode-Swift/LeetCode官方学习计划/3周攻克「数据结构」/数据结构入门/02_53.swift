//
//  Day1_53.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/22.
//

import Foundation

/*
 53. 最大子序和 (简单)
 https://leetcode-cn.com/problems/maximum-subarray/
 */

class Solution_53_3weeksDataStructures {
    /// 法一：动态规划
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var sum = 0, ans = nums[0]
        for i in nums {
//            sum = sum < 0 ? i : sum + i
            // 上面的等价于
            sum = max(sum + i, i)
            
            ans = max(ans, sum)
        }
        
        return ans
    }
    
    func test() {
        print("test")
    }
}
