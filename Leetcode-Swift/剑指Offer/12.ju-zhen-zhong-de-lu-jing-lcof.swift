//
//  12.ju-zhen-zhong-de-lu-jing-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 12. 矩阵中的路径 (中等)
 https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/
 */

class Solution_Offer_12 {
    
    /// DFS + 剪枝
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 || board[0].count == 0 || word.count == 0 {
            return false
        }
        
        let m = board.count
        let n = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        func _dfs(_ row: Int, _ col: Int, _ k: Int) -> Bool {
            if row < 0 || row >= m || col < 0 || col >= n || visited[row][col] {
                return false
            }
            if board[row][col] != Array(word)[k] {
                return false
            }
            if k == word.count - 1 {
                return true
            }
            visited[row][col] = true
            for i in 0..<4 {
                if _dfs(row + dx[i], col + dy[i], k + 1) {
                    return true
                }
            }
            visited[row][col] = false
            return false
        }
        
        for row in 0..<m {
            for col in 0..<n {
                if _dfs(row, col, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    /// 方法超时，由于每次都把字母加到字符串里进行比较，未进行剪枝回溯。
    func exist_chaoshi(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 || board[0].count == 0 || word.count == 0 {
            return false
        }
        
        let m = board.count
        let n = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        func _dfs(_ row: Int, _ col: Int, _ str: String) -> Bool {
            if row < 0 || row >= m || col < 0 || col >= n || visited[row][col] {
                return false
            }
            let newStr = str + String(board[row][col])
            if newStr == word {
                return true
            }
            visited[row][col] = true
            for i in 0..<4 {
                if _dfs(row + dx[i], col + dy[i], newStr) {
                    return true
                }
            }
            visited[row][col] = false
            return false
        }
        
        for row in 0..<m {
            for col in 0..<n {
                if _dfs(row, col, "") {
                    return true
                }
            }
        }
        return false
    }
    
    /*
     测试用例：
     1. 功能测试：
        * 单词在矩阵中：在顶部、下部、左侧、右侧、在中间、有回路
        * 单词不在矩阵中
     2. 边界值测试：矩阵只有1行、只有1列、所有字母都相同
     3. 空矩阵、空字符串
     */
    func test() {
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABC"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ASA"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SE"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ADEE"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "FCED"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCESEEDAS"))
        
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SFDD"))
        print(exist([], "AB"))
        print(exist([[]], "AB"))
        print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], ""))

    }
}
