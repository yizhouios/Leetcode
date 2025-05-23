//
//  08.12.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/28.
//

import Foundation

/*
 面试题 08.12. 八皇后 (困难)
 https://leetcode-cn.com/problems/eight-queens-lcci/
 */

class Solution_08_12 {
    var ans = [[String]]()

    func solveNQueens(_ n: Int) -> [[String]] {
        if n <= 0 {
            return []
        }

        var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
    
        backTree(n, 0, &board)

        return ans
    }

    func backTree(_ n: Int, _ k: Int, _ board: inout [[String]]) {
        if k == n {
            var result = [String]()
            for rowItems in board {
                result.append(rowItems.joined())
            }
            ans.append(result)
            return
        }

        for i in 0..<n {
            if isOK(n, k, i, board) {
                board[k][i] = "Q"
                backTree(n, k + 1, &board)
                board[k][i] = "."
            }
        }
    }

    func isOK(_ n: Int, _ row: Int, _ col: Int, _ board: [[String]]) -> Bool {
        if row >= n || col >= n {
            return false
        }

        var i = row
        var j = col

        // 列是否OK
        while i >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
        }

        // 左对角线是否OK
        i = row - 1
        j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }

            i -= 1
            j -= 1
        }

        // 右对角线是否OK
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }

            i -= 1
            j += 1
        }

        return true
    }
    
    func test() {
        print(solveNQueens(4))
    }
}
