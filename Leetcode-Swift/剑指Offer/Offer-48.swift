//
//  48.zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/23.
//

import Foundation

/*
 剑指 Offer 48. 最长不含重复字符的子字符串 (中等)
 https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/
 */

class Solution_Offer_48 {
    // MARK: - 滑动窗口
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }

        let chars: [Character] = Array(s)
        var ans = 0
        var charSet = Array<Character>()

        for char in chars {
            while charSet.contains(char) {
                charSet.removeFirst()
            }

            charSet.append(char)
            ans = max(ans, charSet.count)
        }

        return ans
    }
    
    // MARK: - 滑动窗口 v2
    func lengthOfLongestSubstring_v2(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let chars: [Character] = Array(s)
        let count = chars.count
        var charSet = Set<Character>()
        var right = -1
        var ans = 0
        
        for i in 0..<count {
            if i != 0 {
                charSet.remove(chars[i - 1])
            }
            
            while (right + 1 < count) && !charSet.contains(chars[right + 1]) {
                charSet.insert(chars[right + 1])
                right += 1
            }
            
            ans = max(ans, right - i + 1)
        }
        
        return ans
    }
}
