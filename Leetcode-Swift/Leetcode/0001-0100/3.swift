//
//  3.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2025/5/19.
//

import Foundation

/*
 3. 无重复字符的最长子串（中等）
 https://leetcode.cn/problems/longest-substring-without-repeating-characters/
 */

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 { return 0 }

        let array = Array(s)
        var dict: [Character : Int] = [:]
        var ans = 0
        var beginIndex = 0

        for i in 0..<array.count {
            let c = array[i]
            let indexC = dict[c]
            if indexC != nil {
                let newBeginIndex = indexC! + 1
                // 此处容易出错，如果没有这个判断条件，"abba"将会计算错误
                if newBeginIndex > beginIndex {
                    beginIndex = newBeginIndex
                }
            }
            dict[c] = i
            ans = max(ans, i - beginIndex + 1)
        }

        return ans
    }
}
