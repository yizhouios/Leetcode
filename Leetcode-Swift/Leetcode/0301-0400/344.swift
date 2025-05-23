//
//  344.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/29.
//

import Foundation

/*
 344. 反转字符串 (简单)
 https://leetcode.cn/problems/reverse-string/
 */

class Solution_344 {
    func reverseString(_ s: inout [Character]) {
        if s.isEmpty {
            return
        }

        var left = 0
        var right = s.count - 1
        while left < right {
            (s[left], s[right]) = (s[right], s[left])

            left += 1
            right -= 1
        }
    }
}
