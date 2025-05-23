//
//  14_200_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/27.
//

import Foundation

/*
 200. 岛屿数量 (中等)
 https://leetcode-cn.com/problems/number-of-islands/
 */

class Solution_14_200_Day20Plan {
    
    /// 深度优先搜索
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        
        let rows = grid.count
        let cols = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        
        func dfs(_ row: Int, _ col: Int) {
            if row < 0 || row >= rows  || col < 0 || col >= cols || visited[row][col] || grid[row][col] == "0" {
                return
            }
            visited[row][col] = true
            for i in 0..<4 {
                dfs(row + dx[i], col + dy[i])
            }
        }
        
        var ans = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if visited[i][j] || grid[i][j] == "0" {
                    continue
                }
                ans += 1
                dfs(i, j)
            }
        }
        
        return ans
    }
    
    /// 广度优先搜索
    func numIslands_bfs(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        
        let rows = grid.count
        let cols = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        
        func bfs(_ row: Int, _ col: Int) {
            var queue = [[row, col]]
            while !queue.isEmpty {
                let head = queue.removeFirst()
                let row = head[0]
                let col = head[1]
                if row < 0 || row >= rows  || col < 0 || col >= cols || visited[row][col] || grid[row][col] == "0" {
                    continue
                }
                visited[row][col] = true
                for i in 0..<4 {
                    queue.append([row + dx[i], col + dy[i]])
                }
            }
        }
        
        var ans = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if visited[i][j] || grid[i][j] == "0" {
                    continue
                }
                ans += 1
                bfs(i, j)
            }
        }
        
        return ans
    }
    
    func test() {
        print(numIslands([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]))
        print(numIslands([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ]))
    }
}
