//
//  13_209_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/26.
//

import Foundation

/*
 209. 长度最小的子数组 (中等)
 https://leetcode-cn.com/problems/minimum-size-subarray-sum/
 */

class Solution_13_209_Day20Plan {
    /// 滑动窗口 (双指针)
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var sum = 0, left = 0
        let len = nums.count
        for right in 0..<len {
            sum += nums[right]
            while sum >= target {
                ans = min(ans, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        return ans == Int.max ? 0 : ans
    }
    
    func test() {
        print(minSubArrayLen(1, [1,1,1,1,1]))
        print(minSubArrayLen(5, [1,1,1,1,1]))
        print(minSubArrayLen(5, [1,1,1,1,1,5]))
        print(minSubArrayLen(7, [2,3,1,2,4,3]))
        print(minSubArrayLen(4, [1,4,4]))
        print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
    }
}
