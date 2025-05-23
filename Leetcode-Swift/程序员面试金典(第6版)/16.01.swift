//
//  16.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/11.
//

import Foundation

/*
 面试题 16.01. 交换数字 (中等)
 https://leetcode.cn/problems/swap-numbers-lcci/
 */

class Solution_16_01 {
    // MARK: - 两数交替异或
    func swapNumbers(_ numbers: [Int]) -> [Int] {
        if numbers.count < 2 {
            return []
        }

        var numbers = numbers
        numbers[0] = numbers[0] ^ numbers[1]
        numbers[1] = numbers[0] ^ numbers[1]
        numbers[0] = numbers[0] ^ numbers[1]

        return numbers
    }
}
