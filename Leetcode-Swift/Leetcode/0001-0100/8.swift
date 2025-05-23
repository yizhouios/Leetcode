//
//  8.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/3.
//

import Foundation

/*
 8. 字符串转换整数 (atoi) (中等)
 https://leetcode.cn/problems/string-to-integer-atoi/
 */

class Solution_8 {
    // MARK: - 提前判断是否将要溢出
    func myAtoi(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }

        let sArray: [Character] = Array(s)
        let count = sArray.count
        var sign = 1
        var ans = 0
        var i = 0
        
        // 前导判断：①去除前导空格、②符号判断
        while i < count {
            let char = sArray[i]
            if char == " " {
                i += 1
                continue
            } else if char == "-" {
                sign = -1
                i += 1
                break
            } else if char == "+" {
                i += 1
                break
            } else {
                break
            }
        }

        while i < count {
            let char = sArray[i]
            if char > "9" || char < "0" {
                break
            }

            if sign == -1 {
                // Int32.min: -2147483648
                if ans * -1 < (Int32.min / 10) || (ans * -1 == (Int32.min / 10) && char > "8") {
                    return Int(Int32.min)
                }
            } else {
                // Int32.max: 2147483647
                if ans > (Int32.max / 10) || (ans == (Int32.max / 10) && char > "7") {
                    return Int(Int32.max)
                }
            }

            ans = ans * 10 + Int(String(char))!
            i += 1
        }

        return ans * sign
    }
}
