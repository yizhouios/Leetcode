//
//  24_39_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/31.
//

import Foundation

/*
 39. 组合总和 (中等)
 https://leetcode-cn.com/problems/combination-sum/
 */

class Solution_24_39_Day20Plan {
    /// 回溯+剪枝
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty {
            return []
        }
        
        let candidates = candidates.sorted()
        let len = candidates.count
        var ans = [[Int]]()
        var path = [Int]()
        
        func dfs(_ target: Int, _ begin: Int) {
            if target < 0 {
                return
            }
            if target == 0 {
                ans.append(path)
                return
            }
            
            for i in begin..<len {
                if target - candidates[i] < 0 {
                    break
                }
                path.append(candidates[i])
                dfs(target - candidates[i], i)
                path.removeLast()
            }
        }
        
        dfs(target, 0)
        
        return ans
    }
    
    func test() {
        print(combinationSum([2,3,6,7], 7))
        print(combinationSum([2,3,5], 8))
    }
}
