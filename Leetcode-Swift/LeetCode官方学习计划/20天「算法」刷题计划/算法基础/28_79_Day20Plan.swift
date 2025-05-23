//
//  28_79_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/1.
//

import Foundation

/*
 79. 单词搜索 (中等)
 https://leetcode-cn.com/problems/word-search/
 */

class Solution_28_79_Day20Plan {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty {
            return false
        }
        
        let rows = board.count
        let cols = board[0].count
        var used = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let word = Array(word)
        let wordLen = word.count
        let dir = [(0,-1), (0,1), (-1,0), (1,0)]
        var ans = false
        
        func dfs(_ row: Int, _ col: Int, _ wordIndex: Int) {
            if used[row][col] {
                return
            }
            
            if board[row][col] != word[wordIndex] {
                return
            }
            
            if wordIndex == wordLen - 1 {
                ans = true
                return
            }
            
            used[row][col] = true
            
            for i in dir {
                let newX = row + i.0
                let newY = col + i.1
                if newX < 0 || newX >= rows || newY < 0 || newY >= cols {
                    continue
                }
                dfs(newX, newY, wordIndex + 1)
                if ans {
                    break
                }
            }
            
            used[row][col] = false
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
    
    func test() {
        print(exist([["a"]], "a"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))
    }
}
