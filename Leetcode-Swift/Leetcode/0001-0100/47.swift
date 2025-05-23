//
//  47.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/4.
//

import Foundation

/*
 47. 全排列 II (中等)
 https://leetcode-cn.com/problems/permutations-ii/
 */

class Solution_47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        let nums = nums.sorted()
        return combine(nums, nums.count)
    }

    func combine(_ nums: [Int], _ k: Int) -> [[Int]] {
        var record = [Bool](repeating: false, count: nums.count)
        var path = [Int]()
        var res = [[Int]]()

        combineCore(nums, k, &record, &path, &res)

        return res
    }

    func combineCore(_ nums: [Int], _ k: Int, _ record: inout [Bool], _ path: inout [Int], _ res: inout [[Int]]) {
        if k <= 0 {
            res.append(path)
            return
        }

        var index = 0
        while index < nums.count {
            if record[index] {
                index += 1
                continue
            }

            record[index] = true
            path.append(nums[index])

            combineCore(nums, k - 1, &record, &path, &res)

            record[index] = false
            path.removeLast()

            index += 1
            while (index < nums.count) && (nums[index] == nums[index - 1]) {
                index += 1
            }
        }
    }
}
