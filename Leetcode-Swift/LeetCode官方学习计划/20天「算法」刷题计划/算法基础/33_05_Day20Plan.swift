//
//  33_05_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/4.
//

import Foundation

/*
 5. 最长回文子串 (中等)
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 */

class Solution_33_05_Day20Plan {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        let s = Array(s)
        let len = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        for i in 0..<len {
            dp[i][i] = true
        }
        
        var begin = 0, end = 0
        // 在状态转移方程中，我们是从长度较短的字符串向长度较长的字符串进行转移的，因此一定要注意动态规划的循环顺序。
        for L in 2...len { // 子串长度
            for l in 0..<len { // 枚举左边界，左边界的上限设置可以宽松一些: 由 L 和 i 可以确定右边界，即 j - i + 1 = L 得
                let r = L + l - 1 // L = r - l + 1
                if r >= len {
                    break
                }
                if s[l] != s[r] {
                    dp[l][r] = false
                } else {
                    if r - l < 3 {
                        dp[l][r] = true
                    } else {
                        dp[l][r] = dp[l + 1][ r - 1]
                    }
                }
                if dp[l][r] && ((r - l) > (end - begin)) {
                    begin = l
                    end = r
                }
            }
        }
        
        return String(s[begin...end])
    }
    
    func test() {
        print(longestPalindrome("aacabdkacaa"))
//        print(longestPalindrome("babad"))
//        print(longestPalindrome("cbbd"))
//        print(longestPalindrome("ac"))
//        print(longestPalindrome("a"))
    }
}
