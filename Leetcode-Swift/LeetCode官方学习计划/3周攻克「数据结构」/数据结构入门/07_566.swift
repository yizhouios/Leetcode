//
//  07_566.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/25.
//

import Foundation

/*
 566. 重塑矩阵 (简单)
 https://leetcode-cn.com/problems/reshape-the-matrix/
 */

class Solution_566_3weeksDataStructures {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if mat.isEmpty {
            return []
        }
        let m = mat.count
        let n = mat[0].count
        
        if m * n != r * c {
            return mat
        }
        
        var ans = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        
//        for i in 0..<r {
//            for j in 0..<c {
//                let index = i * c + j
//                let row = index / n
//                let col = index % n
//                ans[i][j] = mat[row][col]
//            }
//        }
        // 上面注释的和下面的代码作用相同，两种写法
        for i in 0..<(m*n) {
            ans[i / c][i % c] = mat[i / n][i % n]
        }
        
        return ans
    }
    
    func test() {
        print(matrixReshape([[1,2],[3,4]], 1, 4))
        print(matrixReshape([[1,2],[3,4]], 4, 1))
        print(matrixReshape([[1,2,3,4]], 2, 2))
        print(matrixReshape([[1,2],[3,4]], 2, 4))
    }
}
