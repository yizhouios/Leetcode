//
//  29.shun-shi-zhen-da-yin-ju-zhen-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/9.
//

import Foundation

/*
 剑指 Offer 29. 顺时针打印矩阵 (简单)
 https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof/
 */

class Solution_Offer_29 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        if rows == 0 {
            return []
        }
        let cols = matrix[0].count
        if cols == 0 {
            return []
        }
        
        var start = 0
        var ans = [Int]()
        while cols > 2 * start && rows > 2 * start {
            ans += matrixInCircle(matrix, rows, cols, start)
            start += 1
        }
        
        return ans
    }
    
    func matrixInCircle(_ matrix: [[Int]], _ rows: Int, _ cols: Int, _ start: Int) -> [Int] {
        let endX = cols - start - 1
        let endY = rows - start - 1
        
        var ans = [Int]()
        // 左上 -> 右上
        for i in start...endX {
            ans.append(matrix[start][i])
        }
        
        // 右上 -> 右下
        if endY > start {
            for i in (start + 1)...endY {
                ans.append(matrix[i][endX])
            }
        }
        
        // 右下 -> 左下
        if endY > start && endX > start {
            for i in stride(from: endX - 1, to: start - 1, by: -1) { // to对应的值不会取到，最终会取到start
                ans.append(matrix[endY][i])
            }
        }
        
        // 左下 -> 左上
        if endX > start && endY - 1 > start {
            for i in stride(from: endY - 1, to: start, by: -1) { // to对应的值不会取到，最终会取到start + 1
                ans.append(matrix[i][start])
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：多行多列；只有一行；只有一列；一行一列
     */
    func test() {
        print(spiralOrder([[1,2,3],
                           [4,5,6],
                           [7,8,9]]))
        print(spiralOrder([[1,2,3,4],
                           [5,6,7,8],
                           [9,10,11,12]]))
        print(spiralOrder([[1,2,3]]))
        print(spiralOrder([[1],[2],[3]]))
        print(spiralOrder([[1,3],[2,4]]))
        print(spiralOrder([[1,2,3],
                           [4,5,6]]))
    }
}
