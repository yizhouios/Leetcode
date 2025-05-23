//
//  79.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/12.
//

import Foundation

/*
 79. 单词搜索 (中等)
 https://leetcode.cn/problems/word-search/
 */

class Solution_79 {
    // MARK: - DFS
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty || board[0].isEmpty {
            return false
        }
        
        let rows = board.count
        let cols = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let word = Array(word)
        let wordLen = word.count
        var ans = false
        
        func dfs(_ row: Int, _ col: Int, _ wordIndex: Int) {
            if board[row][col] != word[wordIndex]  {
                return
            }
            if wordIndex == wordLen - 1 {
                ans = true
                return
            }
            
            visited[row][col] = true
            
            let dirs = [(0,-1), (0,1), (-1,0), (1,0)]
            for i in dirs {
                let newRow = row + i.0
                let newCol = col + i.1
                if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols || visited[newRow][newCol] {
                    continue
                }
                dfs(newRow, newCol, wordIndex + 1)
                if ans {
                    break
                }
            }
            
            visited[row][col] = false
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                dfs(i, j, 0)
                if ans {
                    break
                }
            }
        }
        
        return ans
    }
}
