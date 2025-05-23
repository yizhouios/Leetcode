//
//  02_1137.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/20.
//

import Foundation

/*
 1137. 第 N 个泰波那契数 (简单)
 https://leetcode-cn.com/problems/n-th-tribonacci-number/
 */

class Solution_1137_dynamic_programming {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n < 3 {
            return 1
        }
        var t0 = 0, t1 = 1, t2 = 1
        for _ in 3...n {
            let newT2 = t0 + t1 + t2
            t0 = t1
            t1 = t2
            t2 = newT2
        }
        return t2
    }
}
