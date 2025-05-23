//
//  39.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/5.
//

import Foundation

/*
 39. 组合总和 (中等)
 https://leetcode-cn.com/problems/combination-sum/
 */

class Solution_39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty {
            return []
        }

        let candidates = candidates.sorted()
        var path = [Int]()
        var ans = [[Int]]()

        combinationSumCore(candidates, 0, target, &path, &ans)

        return ans
    }

    func combinationSumCore(_ candidates: [Int], _ beginIndex: Int, _ target: Int, _ path: inout [Int], _ res: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(path)
        }

        for i in beginIndex..<candidates.count {
            path.append(candidates[i])
            combinationSumCore(candidates, i, target - candidates[i], &path, &res)
            path.removeLast()
        }
    }
}
