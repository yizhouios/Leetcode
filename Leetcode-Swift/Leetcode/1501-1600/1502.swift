//
//  1502.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/26.
//

import Foundation

/*
 1502. 判断能否形成等差数列 (简单)
 https://leetcode-cn.com/problems/can-make-arithmetic-progression-from-sequence/
 */

class Solution_1502 {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        // 参数校验
        if arr.isEmpty || arr.count == 1 {
            return true
        }

        // 排序
        let arr = arr.sorted()
        // 间隔
        let interval = arr[1] - arr[0]
        // 依次判断每两个数之间是否是等差
        for i in 1..<(arr.count) {
            if arr[i] - arr[i - 1] != interval {
                return false
            }
        }

        return true
    }
}
