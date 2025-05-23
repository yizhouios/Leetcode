//
//  77.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/1.
//

import Foundation

/*
 77. 组合 (中等)
 https://leetcode-cn.com/problems/combinations/
 */

class Solution_77 {
    var ans = [[Int]]()

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < 1 || k < 1 {
            return []
        }

        let nums: [Int] = Array(1...n)
        var path = [Int]()
        combineCore(nums, 0, k, &path)

        return ans
    }

    func combineCore(_ nums: [Int], _ begin: Int, _ k: Int, _ path: inout [Int]) {
        if k <= 0 {
            ans.append(path)
            return
        }

        for i in begin..<nums.count {
            let num = nums[i]

            path.append(num)
            combineCore(nums, i + 1, k - 1, &path)
            path.removeLast()
        }
    }
}
