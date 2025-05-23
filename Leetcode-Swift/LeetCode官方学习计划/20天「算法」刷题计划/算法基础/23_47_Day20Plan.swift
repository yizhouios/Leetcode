//
//  23_47_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/31.
//

import Foundation

/*
 47. 全排列 II (中等)
 https://leetcode-cn.com/problems/permutations-ii/
 */

class Solution_23_47_Day20Plan {
    /// 回溯+剪枝（利用剪枝去重）
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
        let nums = nums.sorted()
        var ans = [[Int]]()
        let len = nums.count
        var vis = [Bool](repeating: false, count: len)
        var curPrem = [Int]()
        
        func backtrack(_ index: Int) {
            if index == len {
                ans.append(curPrem)
                return
            }
            
            for i in 0..<len {
                // 如果i所在的位置填充过，填充下一个
                if vis[i] {
                    continue
                }
                // 去重
                if i > 0 && nums[i] == nums[i - 1] && !vis[i - 1] {
                    continue
                }
                vis[i] = true
                curPrem.append(nums[i])
                backtrack(index + 1)
                vis[i] = false
                curPrem.removeLast()
            }
        }
        
        backtrack(0)
        return ans
    }
    
    func test() {
        print(permuteUnique([1,1,2]))
        print(permuteUnique([1,2,3]))
    }
}
