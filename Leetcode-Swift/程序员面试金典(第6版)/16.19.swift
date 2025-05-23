//
//  16.19.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/10.
//

import Foundation

/*
 面试题 16.19. 水域大小 (中等)
 https://leetcode.cn/problems/pond-sizes-lcci/
 */

class Solution_16_19 {
    var count = 0

    // MARK: - DFS
    func pondSizes(_ land: [[Int]]) -> [Int] {
        if land.isEmpty || land[0].isEmpty {
            return []
        }

        var land = land
        var ans = [Int]()
        let rows = land.count
        let cols = land[0].count
        for i in 0..<rows {
            for j in 0..<cols {
                if land[i][j] == 0 {
                    count = 0
                    dfs(&land, i, j, rows, cols)
                    ans.append(count)
                }
            }
        }

        return ans.sorted()
    }

    func dfs(_ land: inout [[Int]], _ i: Int, _ j: Int, _ rows: Int, _ cols: Int) {
        count += 1
        land[i][j] = 1
        let dirs = [
            (i - 1, j),
            (i + 1, j),
            (i, j - 1),
            (i, j + 1),
            (i - 1, j - 1),
            (i + 1, j - 1),
            (i - 1, j + 1),
            (i + 1, j + 1)
        ]
        for (i, j) in dirs {
            if i < 0 || j < 0 || i >= rows || j >= cols || land[i][j] != 0 {
                continue
            }
            dfs(&land, i, j, rows, cols)
        }
    }
}
