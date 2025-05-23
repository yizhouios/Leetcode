//
//  46.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/3.
//

import Foundation

/*
 46. 全排列 (中等)
 https://leetcode-cn.com/problems/permutations/
 */

class Solution_46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        return combine(nums, nums.count)
    }

    func combine(_ nums: [Int], _ k: Int) -> [[Int]] {
        if nums.isEmpty || k <= 0 {
            return []
        }

        var path = [Int]()
        var res = [[Int]]()
        var record = [Bool](repeating: false, count: nums.count)
        combineCore(nums, k, &record, &path, &res)

        return res
    }

    func combineCore(_ nums: [Int], _ k: Int, _ record: inout [Bool], _ path: inout [Int], _ res: inout [[Int]]) {
        if k <= 0 {
            res.append(path)
            return
        }

        for i in 0..<nums.count {
            if record[i] {
                continue
            }

            path.append(nums[i])
            record[i] = true

            combineCore(nums, k - 1, &record, &path, &res)

            path.removeLast()
            record[i] = false
        }
    }
}
