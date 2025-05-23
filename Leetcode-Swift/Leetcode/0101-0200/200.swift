//
//  200.number-of-islands.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/22.
//

import Foundation

/*
 200. 岛屿数量 (中等)
 https://leetcode-cn.com/problems/number-of-islands/
 */

class Solution200 {
    // MARK: - DFS
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid

        var ans = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" {
                    ans += 1
                    dfs(&grid, i, j, rows, cols)
                }
            }
        }

        return ans
    }

    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int, _ rows: Int, _ cols: Int) {
        grid[row][col] = "0"
        
        let directions = [(0,-1), (0,1), (-1,0), (1,0)]
        for i in directions {
            let newRow = row + i.0
            let newCol = col + i.1

            if newRow < 0 || newCol < 0 || newRow >= rows || newCol >= cols || grid[newRow][newCol] == "0" {
                continue
            }
            dfs(&grid, newRow, newCol, rows, cols)
        }
    }
    
    // MARK: - BFS
    func numIslands_v2(_ grid: [[Character]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid
        
        var ans = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "1" {
                    ans += 1
                    grid[row][col] = "0"
                    
                    var queue = [(row, col)]
                    while queue.count > 0 {
                        let head = queue.removeFirst()
                        let i = head.0, j = head.1
                        if i - 1 >= 0 && (grid[i - 1][j]) == "1" {
                            queue.append((i - 1, j))
                            grid[i - 1][j] = "0"
                        }
                        if i + 1 < rows && (grid[i + 1][j]) == "1" {
                            queue.append((i + 1, j))
                            grid[i + 1][j] = "0"
                        }
                        if j - 1 >= 0 && (grid[i][j - 1]) == "1" {
                            queue.append((i, j - 1))
                            grid[i][j - 1] = "0"
                        }
                        if j + 1 < cols && (grid[i][j + 1]) == "1" {
                            queue.append((i, j + 1))
                            grid[i][j + 1] = "0"
                        }
                    }
                }
            }
        }
        return ans
    }
}
