//
//  120_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/19.
//

import Foundation

/*
 120. 三角形最小路径和 (中等)
 https://leetcode-cn.com/problems/triangle/
 */

class Solution_120_Day20Plan {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.isEmpty {
            return 0
        }
        
        var triangle = triangle
        let rows = triangle.count
        for i in 1..<rows {
            let items = triangle[i]
            for j in 0..<items.count {
                if i > 0 {
                    if j > 0 {
                        if j == (items.count) - 1 {
                            triangle[i][j] += triangle[i - 1][j - 1]
                        } else {
                            triangle[i][j] += min(triangle[i - 1][j - 1], triangle[i - 1][j])
                        }
                    } else {
                        triangle[i][j] += triangle[i - 1][j]
                    }
                }
            }
        }
        return triangle[rows - 1].min()!
    }
    
    func test() {
        print(minimumTotal([[-10]]))
        print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
    }
}
