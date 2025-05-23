//
//  542_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/16.
//

import Foundation

/*
 542. 01 矩阵 (中等)
 https://leetcode-cn.com/problems/01-matrix/
 
 推荐题解:
 1. https://leetcode-cn.com/problems/01-matrix/solution/2chong-bfs-xiang-jie-dp-bi-xu-miao-dong-by-sweetie/
 */

class Solution_542_Day20Plan {
    /// 动态规划
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        if mat.isEmpty {
            return []
        }
        
        let rows = mat.count
        let cols = mat[0].count
        var ans = [[Int]](repeating: [Int](repeating: 10000, count: cols), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 0 {
                    ans[i][j] = 0
                }
            }
        }
        
        // 从左上开始（判断 左和上）
        for i in 0..<rows {
            for j in 0..<cols {
                // 判断上
                if i >= 1 {
                    ans[i][j] = min(ans[i][j], ans[i - 1][j] + 1)
                }
                // 判断左
                if j >= 1 {
                    ans[i][j] = min(ans[i][j], ans[i][j - 1] + 1)
                }
            }
        }
        
        // 从右下开始（判断 右和下）
        for i in stride(from: rows - 1, to: -1, by: -1) {
            for j in stride(from: cols - 1, to: -1, by: -1) {
                // 判断下
                if i < rows - 1 {
                    ans[i][j] = min(ans[i][j], ans[i + 1][j] + 1)
                }
                // 判断右
                if j < cols - 1 {
                    ans[i][j] = min(ans[i][j], ans[i][j + 1] + 1)
                }
            }
        }
        
        return ans
    }
    
    /// 广度优先搜索
    func updateMatrix_1(_ mat: [[Int]]) -> [[Int]] {
        if mat.isEmpty {
            return []
        }
        
        let rows = mat.count
        let cols = mat[0].count
        var ans = mat
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        var queue = [(Int, Int)]()
        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 0 {
                    queue.append((i, j))
                    visited[i][j] = true
                } else {
                    ans[i][j] = -1
                }
            }
        }
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            for (newX, newY) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                if newX < 0 || newY < 0 || newX >= rows || newY >= cols || visited[newX][newY] {
                    continue
                }
                ans[newX][newY] = ans[x][y] + 1
                queue.append((newX , newY))
                visited[newX][newY] = true
            }
        }
    
        return ans
    }
    
    func test() {
        print(updateMatrix([[0,0,0],[0,1,0],[0,0,0]]))
        print(updateMatrix([[0,0,0],[0,1,0],[1,1,1]]))
    }
}
