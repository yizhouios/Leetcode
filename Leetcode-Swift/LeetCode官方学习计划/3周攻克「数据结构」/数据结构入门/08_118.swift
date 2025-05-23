//
//  08_118.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/25.
//

import Foundation

/*
 118. 杨辉三角 (简单)
 https://leetcode-cn.com/problems/pascals-triangle/
 */

class Solution_118_3weeksDataStructures {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        if numRows == 2 {
            return [[1], [1,1]]
        }
        var ans = [[1],[1,1]]
        for i in 2..<numRows {
            var tmp = [Int](repeating: 1, count: i + 1)
            for j in 1..<(i) {
                tmp[j] = ans[i - 1][j] + ans[i - 1][j - 1]
            }
            ans.append(tmp)
        }
        return ans
    }
    
    func test() {
        print(generate(1))
        print(generate(2))
        print(generate(3))
        print(generate(5))
    }
}
