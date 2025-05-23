//
//  52.n-queens-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/17.
//

import Foundation

/*
 52. N皇后 II (困难)
 https://leetcode-cn.com/problems/n-queens-ii/
 */

class Solution52 {
    func totalNQueens(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var ans = 0
        var columns = Set<Int>()
        var diagonal1 = Set<Int>()
        var diagonal2 = Set<Int>()
        
        func backtrace(_ row: Int) {
            if row >= n {
                ans += 1
            } else {
                for column in 0..<n {
                    if columns.contains(column) || diagonal1.contains(row - column) || diagonal2.contains(row + column) {
                        continue
                    }
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
    
    /*
     测试用例：
     1. 解决方案不为0的：1、4~9
     2. 解决方案为0：2、3
     */
    func test() {
        print(totalNQueens(0))
        print(totalNQueens(1))
        print(totalNQueens(2))
        print(totalNQueens(3))
        print(totalNQueens(4))
        print(totalNQueens(10))
    }
}
