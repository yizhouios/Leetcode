//
//  40.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/5.
//

import Foundation

/*
 40. 组合总和 II (中等)
 https://leetcode-cn.com/problems/combination-sum-ii/
 */

class Solution_40 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty {
            return []
        }

        let candidates = candidates.sorted()
        var path = [Int]()
        var ans = [[Int]]()
        dfs(candidates, 0, target, &path, &ans)

        return ans
    }

    func dfs(_ candidates: [Int], _ beginIndex: Int, _ target: Int, _ path: inout [Int], _ res: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(path)
            return
        }

        var index = beginIndex
        while index < candidates.count {
            path.append(candidates[index])
            dfs(candidates, index + 1, target - candidates[index], &path, &res)
            path.removeLast()

            index += 1
            while (index > 0) && (index < candidates.count) && (candidates[index] == candidates[index - 1]) {
                index += 1
            }
        }
    }
}
