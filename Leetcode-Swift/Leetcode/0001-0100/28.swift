//
//  28.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/21.
//

import Foundation

/*
 28. 实现 strStr() (简单)
 https://leetcode.cn/problems/implement-strstr/
 */

class Solution_28 {
    // MARK: - 暴力解法
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }

        let charsA: [Character] = Array(haystack)
        let charsB: [Character] = Array(needle)
        let countA = charsA.count
        let countB = charsB.count
        var ans = -1

        for i in 0..<(countA - countB + 1) {
            var match = true
            for j in 0..<countB {
                if charsA[i + j] != charsB[j] {
                    match = false
                }
            }
            if match {
                ans = i
                break
            }
        }

        return ans
    }
}
