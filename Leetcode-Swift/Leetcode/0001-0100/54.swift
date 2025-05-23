//
//  54.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/5.
//

import Foundation

/*
 54. 螺旋矩阵 (中等)
 https://leetcode-cn.com/problems/spiral-matrix/
 */

class Solution_54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 参数校验
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }
        
        let m = matrix.count
        let n = matrix[0].count
        var ans = [Int]()
        // left、right、top、bottom代表每次遍历的矩形四个定点的x或y
        // 左上（top, left）右上(top, right) 右下(bottom, right) 左下(bottom, left)
        var left = 0, right = n - 1, top = 0, bottom = m - 1
        
        while left <= right, top <= bottom {
            // →
            for j in left...right {
                ans.append(matrix[top][j])
            }
            
            // ↓
            if (top + 1) <= bottom {
                for i in (top + 1)...bottom {
                    ans.append(matrix[i][right])
                }
                
                // ←（需判断left和right是否相等，如果不相等，需要遍历从右->左）
                if left != right {
                    for j in stride(from: right - 1, to: left - 1, by: -1) {
                        ans.append(matrix[bottom][j])
                    }
                    
                    // ↑（需判断top和bottom是否相等，如果不相等，需要遍历从下->上）
                    if top != bottom {
                        for i in stride(from: bottom - 1, to: top, by: -1) {
                            ans.append(matrix[i][left])
                        }
                    }
                }
            }
            
            // 向内缩小矩形的范围
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        
        return ans
    }
    
    func test() {
        print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
    }
}
