//
//  46_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/18.
//

import Foundation

/*
 46. 全排列 (中等)
 https://leetcode-cn.com/problems/permutations/
 */

class Solution_46_Day20Plan {
    /// 回溯
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
        var nums = nums
        var ans = [[Int]]()
        let len = nums.count
        
        func backtrack(_ first: Int) {
            if first == len {
                ans.append(nums)
                return
            }
            for i in first..<len {
                // 动态维护数组
                nums.swapAt(first, i)
                backtrack(first + 1)
                nums.swapAt(first, i)
            }
        }
        
        backtrack(0)
        
        return ans
    }
    
    func test() {
        print(permute([1,2,3]))
        print(permute([0,1]))
        print(permute([1]))
    }
}
