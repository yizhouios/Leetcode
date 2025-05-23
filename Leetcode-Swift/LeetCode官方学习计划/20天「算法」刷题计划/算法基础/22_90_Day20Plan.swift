//
//  22_90_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/30.
//

import Foundation

/*
 90. 子集 II (中等)
 https://leetcode-cn.com/problems/subsets-ii/
 */

class Solution_22_90_Day20Plan {
    /// 递归
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
        let nums = nums.sorted()
        let len = nums.count
        var ans = [[Int]]()
        var path = [Int]()
        
        func dfs(_ choosePre: Bool, _ startIndex: Int) {
            if startIndex == len {
                ans.append(path)
                return
            }
            
            // 不选择自己
            dfs(false, startIndex + 1)
            
            // 选择自己（如果上一个没选，且上一个的值和当前值一样，那么当前这个值要过滤掉）
            if !choosePre && startIndex > 0 && nums[startIndex] == nums[startIndex - 1] {
                return
            }
            path.append(nums[startIndex])
            dfs(true, startIndex + 1)
            path.removeLast()
        }
        dfs(false, 0)
        return ans
    }
    
    func test() {
        print(subsetsWithDup([1,2,2]))
        print(subsetsWithDup([0]))
    }
}
