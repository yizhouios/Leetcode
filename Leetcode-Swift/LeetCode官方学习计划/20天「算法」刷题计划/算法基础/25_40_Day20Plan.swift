//
//  25_40_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/31.
//

import Foundation

/*
 40. 组合总和 II (中等)
 https://leetcode-cn.com/problems/combination-sum-ii/
 */

class Solution_25_40_Day20Plan {
    /// 回溯+剪枝
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty {
            return []
        }
        
        let candidates = candidates.sorted()
        let len = candidates.count
        var vis = [Bool](repeating: false, count: len)
        var path = [Int]()
        var ans = [[Int]]()
        
        func dfs(_ target: Int, _ begin: Int) {
            if target < 0 {
                return
            }
            if target == 0 {
                ans.append(path)
                return
            }
            
            for i in begin..<len {
                if i > 0 && candidates[i] == candidates[i - 1] && !vis[i - 1] {
                    continue
                }
                path.append(candidates[i])
                vis[i] = true
                dfs(target - candidates[i], i + 1)
                vis[i] = false
                path.removeLast()
            }
        }
        
        dfs(target, 0)
        
        return ans
    }
    
    func test() {
        print(combinationSum2([10,1,2,7,6,1,5], 8))
    }
}
