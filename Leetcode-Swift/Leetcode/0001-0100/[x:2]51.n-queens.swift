//
//  51.n-queens.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/17.
//

import Foundation

/*
 51. N 皇后 (困难)
 https://leetcode-cn.com/problems/n-queens/
 */

/*
 思路：
 1. 基于集合的回溯
 2. 基于位运算的回溯
 */
class Solution51 {
    
    /// 集合回溯
    func solveNQueens(_ n: Int) -> [[String]] {
        if n <= 0 {
            return []
        }
        var ans = [[String]]()
        var queensInColumn = [Int](repeating: -1, count: n)
        var columns = Set<Int>()
        var diagonal1 = Set<Int>()
        var diagonal2 = Set<Int>()
        var pointString = [String](repeating: ".", count: n)
        
        func backtrace(_ row: Int) {
            if row == n {
                var board = [String]()
                for i in 0..<n {
                    pointString[queensInColumn[i]] = "Q"
                    board.append(pointString.joined())
                    pointString[queensInColumn[i]] = "."
                }
                ans.append(board)
            } else {
                for column in 0..<n {
                    if columns.contains(column) || diagonal1.contains(row - column) || diagonal2.contains(row + column) {
                        continue
                    }
                    queensInColumn[row] = column
                    columns.insert(column)
                    diagonal1.insert(row - column)
                    diagonal2.insert(row + column)
                    backtrace(row + 1)
                    columns.remove(column)
                    diagonal1.remove(row - column)
                    diagonal2.remove(row + column)
                }
            }
        }
        
        backtrace(0)
        
        return ans
    }
    
    func test() {
        print(solveNQueens(4))
    }
}
