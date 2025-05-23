//
//  18_1091_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/29.
//

import Foundation

/*
 1091. 二进制矩阵中的最短路径 (中等)
 https://leetcode-cn.com/problems/shortest-path-in-binary-matrix/
 */

class Solution_18_1091_Day20Plan {
    /// 广度优先搜索
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty || grid[0][0] != 0 {
            return -1
        }
        
        let rows = grid.count
        let cols = rows
        
        if grid[rows - 1][cols - 1] != 0 {
            return -1
        }
        
        var grid = grid
        let distance = [(0,-1), (1,-1), (1,0), (1,1), (0,1), (-1,1), (-1,0), (-1,-1)]
        var queue = [(0,0)]
        var ans = 1
        while !queue.isEmpty {
            var len = queue.count
            while len > 0 {
                let (x, y) = queue.removeFirst()
                if x == rows - 1 && y == cols - 1 {
                    return ans
                }
                for (dx, dy) in distance {
                    let newX = x + dx
                    let newY = y + dy
                    if newX < 0 || newX >= rows || newY < 0 || newY >= cols || grid[newX][newY] == 1 {
                        continue
                    }
                    grid[newX][newY] = 1
                    queue.append((newX, newY))
                }
                len -= 1
            }
            ans += 1
        }
        
        return -1
    }
    
    func test() {
        print(shortestPathBinaryMatrix([[0,1],[1,0]]))
        print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))
        print(shortestPathBinaryMatrix([[0,1,1,0,0,0],[0,1,0,1,1,0],[0,1,1,0,1,0],[0,0,0,1,1,0],[1,1,1,1,1,0],[1,1,1,1,1,0]]))
        print(shortestPathBinaryMatrix([[0,1,0,0],[0,0,0,1],[0,0,0,0],[0,0,0,0]]))
    }
}
