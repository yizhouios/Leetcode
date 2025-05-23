//
//  240.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/5.
//

import Foundation

/*
 240. 搜索二维矩阵 II (中等)
 https://leetcode-cn.com/problems/search-a-2d-matrix-ii/
 */

class Solution_240 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 参数校验
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        // 从左下开始搜索，逐渐缩小搜索范围
        var row = m - 1, col = 0
        while row >= 0 && col < n {
            let val = matrix[row][col]
            if val == target {
                return true
            }
            
            if val > target {
                row -= 1
            } else {
                col += 1
            }
        }
        
        return false
    }
    
    func test() {
        print("test")
    }
}
