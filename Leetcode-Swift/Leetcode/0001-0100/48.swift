//
//  48.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 48. 旋转图像 (中等)
 https://leetcode-cn.com/problems/rotate-image/
 */

class Solution_48 {
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count
        // 先水平翻转
        for i in 0..<(len / 2) {
            for j in 0..<len {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[len - 1 - i][j]
                matrix[len - 1 - i][j] = tmp
            }
        }
        // 主对角线翻转
        for i in 0..<len {
            for j in 0..<i {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
    }
}
