//
//  04.er-wei-shu-zu-zhong-de-cha-zhao-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 04. 二维数组中的查找 (中等)
 https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/
 */

class Solution_Offer_04 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        let rows = matrix.count
        let cols = matrix[0].count
        var row = 0
        var col = cols - 1
        while row < rows && col >= 0 {
            let value = matrix[row][col]
            if value == target {
                return true
            } else if value > target {
                col -= 1
            } else {
                row += 1
            }
        }
        
        return false
    }
    
    /*
     测试用例：
     1. 存在target（最大值、最小值；中间）；不存在target（大于最大值、小于最小值；中间不存在的值）
     2. 数组中元素为空：matrix = []；matrix = [[]]
     */
    func test() {
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 1))
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 9))
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 30))
        
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], -1))
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 20))
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 31))
        print(findNumberIn2DArray([], 1))
        print(findNumberIn2DArray([[]], 1))
    }
}
