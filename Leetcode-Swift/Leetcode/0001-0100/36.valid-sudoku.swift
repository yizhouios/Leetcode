//
//  36.valid-sudoku.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/17.
//

import Foundation

/*
 36. 有效的数独 (中等)
 https://leetcode-cn.com/problems/valid-sudoku/
 */

class Solution36 {
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // 特殊校验：因leetcode题目说明了，可以注释，面试时应该加上确保输入的正确性
//        if board.count < 9 {
//            return false
//        }
//        for i in board {
//            if i.count < 9 {
//                return false
//            }
//        }
        var rowsSets: [Dictionary<Character, Int>] = [Dictionary<Character, Int>](repeating: Dictionary<Character, Int>(), count: 9)
        var colsSets: [Dictionary<Character, Int>] = [Dictionary<Character, Int>](repeating: Dictionary<Character, Int>(), count: 9)
        var squareSets: [Dictionary<Character, Int>] = [Dictionary<Character, Int>](repeating: Dictionary<Character, Int>(), count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                let value: Character = board[i][j]
                if value == "." {
                    continue
                }
                if rowsSets[i][value] != nil {
                    return false
                }
                if colsSets[j][value] != nil {
                    return false
                }
                let squreIndex = 3 * (i / 3) + j / 3
                if squareSets[squreIndex][value] != nil {
                    return false
                }
                rowsSets[i][value] = 1
                colsSets[j][value] = 1
                squareSets[squreIndex][value] = 1
            }
        }
        return true
    }
    
    /// 一次遍历，使用set进行判重
    func isValidSudoku_byset(_ board: [[Character]]) -> Bool {
        // 特殊校验：因leetcode题目说明了，可以注释，面试时应该加上确保输入的正确性
//        if board.count < 9 {
//            return false
//        }
//        for i in board {
//            if i.count < 9 {
//                return false
//            }
//        }
        var rowsSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        var colsSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        var squareSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                let value: Character = board[i][j]
                if value == "." {
                    continue
                }
                if rowsSets[i].contains(value) {
                    return false
                }
                if colsSets[j].contains(value) {
                    return false
                }
                let squreIndex = 3 * (i / 3) + j / 3
                if squareSets[squreIndex].contains(value) {
                    return false
                }
                rowsSets[i].insert(value)
                colsSets[j].insert(value)
                squareSets[squreIndex].insert(value)
            }
        }
        return true
    }
    
    /*
     测试用例：
     1. 行不合法；列不合法；3x3不合法
     2. 行、列、3x3都合法
     3. 特殊测试：行列小于9
     
     */
    func test() {
        let board1: [[Character]] =
        [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]

        let board2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                     ,["6",".",".","1","9","5",".",".","."]
                     ,[".","9","8",".",".",".",".","6","."]
                     ,["8",".",".",".","6",".",".",".","3"]
                     ,["4",".",".","8",".","3",".",".","1"]
                     ,["7",".",".",".","2",".",".",".","6"]
                     ,[".","6",".",".",".",".","2","8","."]
                     ,[".",".",".","4","1","9",".",".","5"]
                     ,[".",".",".",".","8",".",".","7","9"]]

        print(isValidSudoku([
            ["8","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7",],
        ]))
        print(isValidSudoku([
            ["8","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
        ]))
        print(isValidSudoku(board1))
        print(isValidSudoku(board2))
        
        // leetcode未过用例：
        // 1.
        let unPassedCase: [[Character]] = [
            [".",".","4",".",".",".","6","3","."],
            [".",".",".",".",".",".",".",".","."],
            ["5",".",".",".",".",".",".","9","."],
            [".",".",".","5","6",".",".",".","."],
            ["4",".","3",".",".",".",".",".","1"],
            [".",".",".","7",".",".",".",".","."],
            [".",".",".","5",".",".",".",".","."],
            [".",".",".",".",".",".",".",".","."],
            [".",".",".",".",".",".",".",".","."]]
        print(isValidSudoku(unPassedCase))
    }
}
