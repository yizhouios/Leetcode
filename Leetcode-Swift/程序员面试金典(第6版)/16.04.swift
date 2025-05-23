//
//  16.04.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 面试题 16.04. 井字游戏 (中等)
 https://leetcode-cn.com/problems/tic-tac-toe-lcci/
 */

class Solution_jindian_1604 {
    func tictactoe(_ board: [String]) -> String {
        if board.isEmpty || board[0].isEmpty {
            return ""
        }
        
        let boardArray = board.map { Array($0) }
        let count = boardArray.count
        
        // 特殊情况，只有1个字符（需注意）
        if count == 1 {
            return board[0]
        }
        
        // -1代表未判定、0代表此行没人获胜
        var rows = [Int](repeating: -1, count: count)
        // -1代表未判定、0代表此列没人获胜
        var cols = [Int](repeating: -1, count: count)
        var isHavingEmptyChar = false
        // 遍历空位并标记所在的行和列没人获胜
        for i in 0..<count {
            for j in 0..<count {
                if boardArray[i][j] == " " {
                    isHavingEmptyChar = true
                    rows[i] = 0
                    cols[j] = 0
                }
            }
        }
        
        // 遍历行
        for i in 0..<count {
            for j in 1..<count {
                if rows[i] == 0 {
                    break
                }
                if boardArray[i][j] != boardArray[i][j - 1] {
                    rows[i] = 0
                    break
                }
                if j == (count - 1) {
                    return String(boardArray[i][j])
                }
            }
        }
        
        // 遍历列
        for j in 0..<count {
            for i in 1..<count {
                if cols[j] == 0 {
                    break
                }
                if boardArray[i][j] != boardArray[i - 1][j] {
                    cols[j] = 0
                    break
                }
                if i == (count - 1) {
                    return String(boardArray[i][j])
                }
            }
        }
        
        // 遍历左上到右下交叉线
        for i in 1..<count {
            // 需注意
            if boardArray[i][i] == " " {
                break
            }
            if boardArray[i][i] != boardArray[i - 1][i - 1] {
                break
            }
            if i == count - 1 {
                return String(boardArray[i][i])
            }
        }
        
        // 遍历右上到左下交叉线
        for i in 1..<count {
            // 需注意
            if boardArray[i][count - 1 - i] == " " {
                break
            }
            if boardArray[i][count - 1 - i] != boardArray[i - 1][count - i] {
                break
            }
            if i == count - 1 {
                return String(boardArray[i][count - 1 - i])
            }
        }
        
        return isHavingEmptyChar ? "Pending" : "Draw"
    }
}
