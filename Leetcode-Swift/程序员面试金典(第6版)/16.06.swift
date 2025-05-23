//
//  16.06.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/2.
//

import Foundation

/*
 面试题 16.06. 最小差 (中等)
 https://leetcode.cn/problems/smallest-difference-lcci/
 */

class Solution_16_06 {
    // MARK: - 排序+双指针
    func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
        let a = a.sorted()
        let b = b.sorted()

        var ans = Int.max
        var p0 = 0
        var p1 = 0
        
        while p0 < a.count && p1 < b.count {
            let valA = a[p0]
            let valB = b[p1]

            if valA == valB {
                return 0
            }

            ans = min(ans, abs(valA - valB))
            valA < valB ? (p0 += 1) : (p1 += 1)
        }

        return ans
    }
}
