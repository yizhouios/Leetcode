//
//  37.sudoku-solver.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/17.
//

import Foundation

/*
 37. 解数独 (困难)
 https://leetcode-cn.com/problems/sudoku-solver/
 */

class Solution_37 {
    var rowExits = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var colExits = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var boardExits = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var finished = false

    func solveSudoku(_ board: inout [[Character]]) {
        if board.isEmpty || board[0].isEmpty {
            return
        }
        
        let rows = board.count
        let cols = board[0].count

        if rows != 9 ||  cols != 9 {
            return
        }

        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    let val = Int(board[i][j].unicodeScalars.first!.value) - 48
                    recordTrueAt(i, j, val)
                }
            }
        }
        
        playSudoku(&board, 0, 0)
    }

    func playSudoku(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        if finished { return }

        var isNeedFillIn = false
        var i = i, j = j
        while i < 9 && j < 9 {
            if needFillIn(i, j, board) {
                isNeedFillIn = true
                break
            }
            i = i + (j + 1) / 9
            j = (j + 1) % 9
        }
        
        if !isNeedFillIn {
            finished = true
            return
        }

        for number in 1...9 {
            if !canFillIn(i, j, number, board) {
                continue
            }
            
            board[i][j] = Character(String(number))
            recordTrueAt(i, j, number)
            
            let nextI = i + (j + 1) / 9
            let nextJ = (j + 1) % 9
            playSudoku(&board, nextI, nextJ)

            if finished { return }

            board[i][j] = "."
            recordFalseAt(i, j, number)
        }
    }

    func needFillIn(_ i: Int, _ j: Int, _ board: [[Character]]) -> Bool {
        return board[i][j] == "."
    }

    func canFillIn(_ i: Int, _ j: Int, _ number: Int, _ board: [[Character]]) -> Bool {
        let number = number - 1
        let boardIndex = (i / 3 * 3) + (j / 3)
        return !rowExits[i][number] && !colExits[j][number] && !boardExits[boardIndex][number]
    }

    func recordTrueAt(_ i: Int, _ j: Int, _ number: Int) {
        let number = number - 1
        
        rowExits[i][number] = true
        colExits[j][number] = true
        let boardIndex = (i / 3 * 3) + (j / 3)
        boardExits[boardIndex][number] = true
    }

    func recordFalseAt(_ i: Int, _ j: Int, _ number: Int) {
        let number = number - 1
        
        rowExits[i][number] = false
        colExits[j][number] = false
        let boardIndex = (i / 3 * 3) + (j / 3)
        boardExits[boardIndex][number] = false
    }
    
    func test() {
        var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        
        solveSudoku(&board)
        
        board.print()
    }
}
