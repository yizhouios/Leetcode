//
//  08.05.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/24.
//

import Foundation

/*
 面试题 08.05. 递归乘法 (中等)
 https://leetcode-cn.com/problems/recursive-mulitply-lcci/
 */

class Solution_Jindian_0805 {
    // 递归解法
    func multiply(_ A: Int, _ B: Int) -> Int {
        if A == 1 {
            return B
        }
        if B == 1 {
            return A
        }

        // 先计算一半的B
        var ans = multiply(A >> 1, B)
        // B的一半 + B的一半
        ans += ans
        // 如果A是奇数，加上剩下的
        if A & 1 == 1 {
            ans += B
        }
        return ans
    }
}
