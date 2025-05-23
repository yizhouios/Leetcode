//
//  07_15_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/24.
//

import Foundation

/*
 15. 三数之和 (中等)
 https://leetcode-cn.com/problems/3sum/
 */

class Solution_07_15_Day20Plan {
    /// 排序 + 双指针
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
        let nums = nums.sorted()
        var ans = [[Int]]()
        let len = nums.count
        for i in 0..<len {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            let target = -nums[i]
            var k = len - 1
            for j in (i + 1)..<len {
                if j > (i + 1) && nums[j] == nums[j - 1] {
                    continue
                }
                while j < k && (nums[j] + nums[k] > target) {
                    k -= 1
                }
                if j == k {
                    continue
                }
                if nums[j] + nums[k] == target {
                    ans.append([nums[i], nums[j], nums[k]])
                }
            }
        }
        
        return ans
    }
    
    func test() {
        print(threeSum([-1,0,1,2,-1,-4]))
        print(threeSum([]))
        print(threeSum([0]))
        print(threeSum([0,0]))
        print(threeSum([0,0,0]))
    }
}
