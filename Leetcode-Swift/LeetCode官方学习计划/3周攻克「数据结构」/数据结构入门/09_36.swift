//
//  09_36.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/26.
//

import Foundation

/*
 36. 有效的数独 (中等)
 https://leetcode-cn.com/problems/valid-sudoku/
 */

class Solution_36_3weeksDataStructures {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
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
    
    func test() {
        print(isValidSudoku([["5","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]]))
        print(isValidSudoku([["8","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]]))
    }
}
