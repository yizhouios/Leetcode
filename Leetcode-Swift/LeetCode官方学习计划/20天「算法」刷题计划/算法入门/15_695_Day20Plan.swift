//
//  695_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/15.
//

import Foundation

/*
 695. 岛屿的最大面积 (中等)
 https://leetcode-cn.com/problems/max-area-of-island/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/max-area-of-island/solution/dao-yu-de-zui-da-mian-ji-by-leetcode-solution/
 */

class Solution_695_Day20Plan {
    /// 深度优先搜索
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var ans = 0
        var area = 0
        
        func dfs(_ x: Int, _ y: Int) {
            area += 1
            grid[x][y] = 0
            
            for (row, col) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == 0 {
                    continue
                }
                dfs(row, col)
            }
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 0 {
                    continue
                }
                area = 0
                dfs(i, j)
                ans = max(ans, area)
            }
        }
        
        return ans
    }
    
    /// 广度优先搜索+队列
    func maxAreaOfIsland_1(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var ans = 0
        var queue = [(Int, Int)]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                var area = 0
                queue.append((i, j))
                while !queue.isEmpty {
                    let (x, y) = queue.removeFirst()
                    if x < 0 || y < 0 || x >= rows || y >= cols || grid[x][y] != 1 {
                        continue
                    }
                    area += 1
                    grid[x][y] = 0
                    for (dx, dy) in [(0, -1), (0, 1), (-1, 0), (1, 0)] {
                        queue.append(((x + dx), (y + dy)))
                    }
                    ans = max(ans, area)
                }
            }
        }
        
        return ans
    }
    
    func test() {
        print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,1,1,0,1,0,0,0,0,0,0,0,0],
                               [0,1,0,0,1,1,0,0,1,0,1,0,0],
                               [0,1,0,0,1,1,0,0,1,1,1,0,0],
                               [0,0,0,0,0,0,0,0,0,0,1,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
        print(maxAreaOfIsland([[0,0,0]]))
    }
}
