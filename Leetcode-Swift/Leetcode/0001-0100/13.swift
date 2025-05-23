//
//  13.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/16.
//

import Foundation

/*
 13. 罗马数字转整数 (简单)
 https://leetcode.cn/problems/roman-to-integer/
 */

class Solution_13 {
    // MARK: - 贪心解法
    func romanToInt(_ s: String) -> Int {
        let combinations = [
            "M": 1000,
            "CM": 900,
            "D": 500,
            "CD": 400,
            "C": 100,
            "XC": 90,
            "L": 50,
            "XL": 40,
            "X": 10,
            "IX": 9,
            "V": 5,
            "IV": 4,
            "I": 1
        ]

        let count = s.count
        let chars: [Character] = Array(s)
        var ans = 0
        var index = 0

        while index < count {
            if (index + 1 < count) {
                let combine = String(chars[index...index+1])
                if let val = combinations[combine] {
                    ans += val
                    index += 2
                    continue
                }
            }

            if let val = combinations[String(chars[index])] {
                ans += val
            }
            index += 1
        }

        return ans
    }
    
    // MARK: - 模拟
    func romanToInt_v2(_ s: String) -> Int {
        let map: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]

        var ans = 0, last = Int.max
        s.forEach { charcter in
            let cur = map[charcter] ?? 0;
            ans += cur

            if cur > last {
                ans -= last * 2
            }

            last = cur;
        }

        return ans;
    }
}
