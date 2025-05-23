//
//  12.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/8.
//

import Foundation

/*
 12. 整数转罗马数字 (中等)
 https://leetcode.cn/problems/integer-to-roman/
 */

class Solution_12 {
    // MARK: - 贪心算法
    func intToRoman(_ num: Int) -> String {
        let numMaps = [
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I")
        ]

        var ans = ""
        var num = num

        for (number, numberStr) in numMaps {
            while num >= number {
                num -= number
                ans += numberStr
            }

            if num == 0 {
                break
            }
        }

        return ans
    }
}
