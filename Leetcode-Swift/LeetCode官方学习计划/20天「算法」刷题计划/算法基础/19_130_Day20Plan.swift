//
//  19_130_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/29.
//

import Foundation

/*
 130. 被围绕的区域 (中等)
 https://leetcode-cn.com/problems/surrounded-regions/
 */

class Solution_19_130_Day20Plan {
    /// 广度优先搜索
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty || board[0].isEmpty {
            return
        }
        
        let rows = board.count
        let cols = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let dir = [(0,-1), (1,0), (0,1), (-1,0)]
        
        func bfs(_ x: Int, _ y: Int) {
            var willUpdateQueue = [(Int, Int)]()
            var canUpdate = true
            
            var queue = [(x, y)]
            while !queue.isEmpty {
                var len = queue.count
                while len > 0 {
                    len -= 1
                    let (i, j) = queue.removeFirst()
                    if canUpdate {
                        if i == 0 || i == rows - 1 || j == 0 || j == cols - 1 {
                            canUpdate = false
                        }
                    }
                    
                    if visited[i][j] {
                        continue
                    }
                    visited[i][j] = true
                    willUpdateQueue.append((i, j))
                    
                    for (dx, dy) in dir {
                        let newX = i + dx
                        let newY = j + dy
                        if newX < 0 || newX >= rows || newY < 0 || newY >= cols || board[newX][newY] == "X" {
                            continue
                        }
                        queue.append((newX, newY))
                    }
                }
            }
            if canUpdate && !willUpdateQueue.isEmpty {
                for (x, y) in willUpdateQueue {
                    board[x][y] = "X"
                }
            }
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if board[i][j] == "X" {
                    continue
                }
                if !visited[i][j] {
                    bfs(i, j)
                }
            }
        }
    }
    
    func test() {
        var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        solve(&board)
        board.print()

        board = [["X"]]
        solve(&board)
        board.print()

        board = [["X","X","X"], ["X","O","X"], ["X","X","X"]]
        solve(&board)
        board.print()

        board = [["O","O","O"], ["X","O","X"], ["X","X","X"]]
        solve(&board)
        board.print()
        
        board = [["X","O","X","O","O","O","O"],
                 ["X","O","O","O","O","O","O"],
                 ["X","O","O","O","O","X","O"],
                 ["O","O","O","O","X","O","X"],
                 ["O","X","O","O","O","O","O"],
                 ["O","O","O","O","O","O","O"],
                 ["O","X","O","O","O","O","O"]]
        solve(&board)
        board.print()

    }
}
