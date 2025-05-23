//
//  10.05.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/29.
//

import Foundation

/*
 面试题 10.05. 稀疏数组搜索 (简单)
 https://leetcode-cn.com/problems/sparse-array-search-lcci/
 */

class Solution_Jindian_1005 {
    func findString(_ words: [String], _ s: String) -> Int {
        var low = 0
        var high = words.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            // 如果是空字符串，那么只能缩减区间
            if words[mid] == "" {
                // 缩减前先判断是否是要找的字符串
                if words[high] == s {
                    return high
                }
                high -= 1
            } else if words[mid] == s {
                return mid
            } else if words[mid] > s {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return -1
    }
}
