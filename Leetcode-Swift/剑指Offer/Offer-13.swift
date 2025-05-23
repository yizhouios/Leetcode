//
//  13.ji-qi-ren-de-yun-dong-fan-wei-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 13. 机器人的运动范围 (中等)
 https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
 */

class Solution_Offer_13 {
    var visited = [[Bool]]()
    var ans = 0

    // MARK: - DFS（深度优先搜索）
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if (m < 0) || (n < 0) || (k < 0) {
            return 0
        }

        visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        dfs(0, m, 0, n, k)

        return ans
    }

    func dfs(_ row: Int, _ rows: Int, _ col: Int, _ cols: Int, _ k : Int) {
        let sum = getDititSum(row) + getDititSum(col)
        if sum > k {
            return
        }

        visited[row][col] = true
        ans += 1

        let directioins = [(0, -1), (0, 1), (-1, 0), (1, 0)]
        for dir in directioins {
            let newRow = row + dir.0
            let newCol = col + dir.1
            if (newRow < 0) || (newRow >= rows) || (newCol < 0) || (newCol >= cols) || visited[newRow][newCol] {
                continue
            }
            dfs(newRow, rows, newCol, cols, k)
        }
    }

    func getDititSum(_ num: Int) -> Int {
        var num = num
        var sum = 0
        while num > 0 {
            sum += (num % 10)
            num = (num / 10)
        }
        return sum
    }
}
