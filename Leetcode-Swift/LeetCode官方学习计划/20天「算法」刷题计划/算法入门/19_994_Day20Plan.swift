//
//  994_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/17.
//

import Foundation

/*
 994. 腐烂的橘子 (中等)
 https://leetcode-cn.com/problems/rotting-oranges/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/rotting-oranges/solution/fu-lan-de-ju-zi-by-leetcode-solution/
 */

class Solution_994_Day20Plan {
    /// 多源广度优先搜索
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return -1
        }
        
        let rows = grid.count
        let cols = grid[0].count
        
        var grid = grid
        
        var queue = [(Int, Int)]()
        var freshCount = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 2 {
                    queue.append((i, j))
                } else if grid[i][j] == 1 {
                    freshCount += 1
                }
            }
        }
        
        var minusSecond = 0
        while !queue.isEmpty {
            var len = queue.count
            var infected = false
            while len > 0 {
                let (x, y) = queue.removeFirst()
                for (newX, newY) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                    if newX < 0 || newY < 0 || newX >= rows || newY >= cols || grid[newX][newY] != 1 {
                        continue
                    }
                    infected = true
                    grid[newX][newY] = 2
                    freshCount -= 1
                    queue.append((newX , newY))
                }
                len -= 1
            }
            if infected {
                minusSecond += 1
            }
        }

        return freshCount == 0 ? minusSecond : -1
    }
    
    func test() {
        print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]]))
        /*
         2 1 1
         0 1 1
         1 0 1
         */
        print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
        print(orangesRotting([[0,2]]))
        
        // leetcode
        print(orangesRotting([[0]])) // 0
    }
}
