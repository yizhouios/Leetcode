//
//  78.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/1.
//

import Foundation

/*
 78. 子集 (中等)
 https://leetcode-cn.com/problems/subsets/
 */

class Solution_78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        var ans = [[Int]]()

        for i in 0...nums.count {
            let combines = combine(nums, i)
            ans.append(contentsOf: combines)
        }

        return ans
    }

    func combine(_ nums: [Int], _ k: Int) -> [[Int]] {
        if k <= 0 {
            return [[]]
        }

        var ans = [[Int]]()
        var path = [Int]()

        combineCore(nums, 0, k, &path, &ans)

        return ans
    }

    func combineCore(_ nums: [Int], _ begin: Int, _ k: Int, _ path: inout [Int], _ ans: inout [[Int]]) {
        if k <= 0 {
            ans.append(path)
            return
        }

        for i in begin..<nums.count {
            let num = nums[i]

            path.append(num)
            combineCore(nums, i + 1, k - 1, &path, &ans)
            path.removeLast()
        }
    }
}
