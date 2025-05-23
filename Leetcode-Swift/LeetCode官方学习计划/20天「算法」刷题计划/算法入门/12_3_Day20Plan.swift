//
//  3_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/14.
//

import Foundation

/*
 3. 无重复字符的最长子串 (中等)
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/wu-zhong-fu-zi-fu-de-zui-chang-zi-chuan-by-leetc-2/
 */

class Solution_3_Day20Plan {
    /// 思路：滑动窗口（不用哈希表去重，利用遍历去重）
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let s = Array(s)
        var ans = 0
        var left = 0
        var right = 0
        
        while right < s.count {
            var i = left
            while i < right {
                if s[i] == s[right] {
                    left = i + 1
                    break
                }
                i += 1
            }
            ans = max(ans, right - left + 1)
            right += 1
        }
        
        return ans
    }
    
    /// 思路：滑动窗口+Set
    func lengthOfLongestSubstring_2(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let s = Array(s)
        let len = s.count
        var set = Set<Character>()
        var ans = 0
        var right = -1
        
        for i in 0..<len {
            if i != 0 {
                set.remove(s[i - 1])
            }
            while right + 1 < len && !set.contains(s[right + 1]) {
                set.insert(s[right + 1])
                right += 1
            }
            ans = max(ans, right - i + 1)
        }
        
        return ans
    }
    
    /// 思路：滑动窗口+哈希表
    func lengthOfLongestSubstring_1(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let s = Array(s)
        var map = [Character: Int]()
        var ans = 0
        var left = 0
        var right = 0
        
        while right < s.count {
            let char = s[right]
            if map[char] != nil {
                let newLeft = map[char]! + 1
                for i in left..<newLeft {
                    map[s[i]] = nil
                }
                left = newLeft
                map[char] = right
            } else {
                map[char] = right
                ans = max(ans, right - left + 1)
            }
            right += 1
        }
        
        return ans
    }
    
    func test() {
        print(lengthOfLongestSubstring("abcabcbb"))
        print(lengthOfLongestSubstring("bbbbb"))
        print(lengthOfLongestSubstring("pwwkew"))
        print(lengthOfLongestSubstring(""))

        print(lengthOfLongestSubstring("abcde"))
    }
}
