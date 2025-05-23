//
//  216.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/6.
//

import Foundation

/*
 216. 组合总和 III (中等)
 https://leetcode-cn.com/problems/combination-sum-iii/
 */

class Solution_216 {
    var path = [Int]()
    var ans = [[Int]]()
    var sum = 0

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        if (k <= 0) || (n <= 0) {
            return []
        }

        dfs(k, n, 1)

        return ans
    }

    func dfs(_ k: Int, _ n: Int, _ begin: Int) {
        if (k == 0) && (sum == n) {
            ans.append(path)
            return
        }

        if (begin > 9) || (k <= 0) {
            return
        }

        for i in begin...9 {
            sum += i
            path.append(i)

            dfs(k - 1, n, i + 1)

            path.removeLast()
            sum -= i
        }
    }
}
