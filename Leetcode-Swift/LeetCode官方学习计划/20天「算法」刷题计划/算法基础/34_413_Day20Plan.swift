//
//  34_413_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/4.
//

import Foundation

/*
 413. 等差数列划分 (中等)
 https://leetcode-cn.com/problems/arithmetic-slices/
 */
class Solution_34_413_Day20Plan {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        let len = nums.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        for i in 0...(len - 3) {
            if nums[i] - nums[i + 1] == nums[i + 1] - nums[i + 2] {
                dp[i][i + 2] = true
            }
        }
        
        if len > 3 {
            for L in 4...len {
                for i in 0...(len - L) {
                    let j = i + L - 1
                    if dp[i][j - 1] {
                        if nums[j] - nums[j - 1] == nums[j - 1] - nums[j - 2] {
                            dp[i][j] = true
                        }
                    }
                }
            }
        }
        
        var ans = 0
        for i in dp {
            for j in i {
                if j {
                    ans += 1
                }
            }
        }
        
        return ans
    }
    
    func test() {
        print(numberOfArithmeticSlices([1,2,3,4]))
        print(numberOfArithmeticSlices([2,10,3]))
        print(numberOfArithmeticSlices([1]))
    }
}
