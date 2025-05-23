//
//  01.02.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 面试题 01.02. 判定是否互为字符重排 (简单)
 https://leetcode-cn.com/problems/check-permutation-lcci/
 */

class Solution_Jindian_0102 {
    func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
        // 参数校验
        if s1.count != s2.count {
            return false
        }
        
        var map = [Character: Int]()

        for c in Array(s1) {
            map[c, default: 0] += 1
        }
        for c in Array(s2) {
            if let count = map[c] {
                map[c] = count - 1
            } else {
                return false
            }
        }

        for val in map.values {
            if val != 0 {
                return false
            }
        }

        return true
    }
}
