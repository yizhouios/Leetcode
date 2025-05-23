//
//  10.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/25.
//

import Foundation

/*
 面试题 10.01. 合并排序的数组 (简单)
 https://leetcode-cn.com/problems/sorted-merge-lcci/
 */

class Solution_Jindian_1001 {
    func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {
        // 参数校验
        if A.isEmpty || B.isEmpty || m < 0 || n < 0 {
            return
        }

        // 从后往前依次往A的末尾填入较大值
        var index = m + n - 1
        var m = m - 1, n = n - 1
        while m >= 0 && n >= 0 {
            if A[m] >= B[n] {
                A[index] = A[m]
                m -= 1
            } else {
                A[index] = B[n]
                n -= 1
            }
            index -= 1
        }

        // 填入剩余的数
        while m >= 0 {
            A[index] = A[m]
            m -= 1
            index -= 1
        }
        while n >= 0 {
            A[index] = B[n]
            n -= 1
            index -= 1
        }
    }
}
