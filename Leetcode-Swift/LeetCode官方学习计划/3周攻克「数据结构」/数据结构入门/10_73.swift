//
//  10_73.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/26.
//

import Foundation

/*
 73. 矩阵置零 (中等)
 https://leetcode-cn.com/problems/set-matrix-zeroes/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/set-matrix-zeroes/solution/o1kong-jian-by-powcai/
 */

class Solution_73_3weeksDataStructures {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.isEmpty {
            return
        }
        let m = matrix.count
        let n = matrix[0].count
        var row0HasZero = false
        var col0HasZero = false
        for i in 0..<n {
            if matrix[0][i] == 0 {
                row0HasZero = true
                break
            }
        }
        for i in 0..<m {
            if matrix[i][0] == 0 {
                col0HasZero = true
                break
            }
        }
        for i in 1..<m {
            for j in 1..<n {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<m {
            for j in 1..<n {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        if row0HasZero {
            for j in 0..<n {
                matrix[0][j] = 0
            }
        }
        if col0HasZero {
            for i in 0..<m {
                matrix[i][0] = 0
            }
        }
    }
    
    func test() {
        var matrix = [[1,1,1],[1,0,1],[1,1,1]]
        setZeroes(&matrix)
        matrix.print()
    }
}
