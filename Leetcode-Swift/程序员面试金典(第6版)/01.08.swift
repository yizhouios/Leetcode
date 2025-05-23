//
//  01.08.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 面试题 01.08. 零矩阵 (中等)
 https://leetcode-cn.com/problems/zero-matrix-lcci/
 */

class Solution_jindian_0108 {
    func setZeroes(_ matrix: inout [[Int]]) {
        // 判空处理
        if matrix.isEmpty || matrix[0].isEmpty {
            return
        }
        
        let m = matrix.count
        let n = matrix[0].count
        var rows = [Bool](repeating: false, count: m)
        var cols = [Bool](repeating: false, count: n)
        
        // 遍历所有元素，标记哪些行和列需要清零
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    rows[i] = true
                    cols[j] = true
                }
            }
        }
        
        // 清零操作
        for i in 0..<m {
            for j in 0..<n {
                if rows[i] || cols[j] {
                    matrix[i][j] = 0
                }
            }
        }
    }
    
    func test() {
        var matrix = [
            [1,1,1],
            [1,0,1],
            [1,1,1]
          ]
        setZeroes(&matrix)
        matrix.print()
        
        matrix = [
            [0,1,2,0],
            [3,4,5,2],
            [1,3,1,5]
          ]
        setZeroes(&matrix)
        matrix.print()
    }
}
