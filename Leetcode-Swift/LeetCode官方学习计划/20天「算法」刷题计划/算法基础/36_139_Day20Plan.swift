//
//  36_139_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/5.
//

import Foundation

/*
 139. 单词拆分 (中等)
 https://leetcode-cn.com/problems/word-break/
 */

class Solution_36_139_Day20Plan {
    /// 动态规划
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.isEmpty {
            return true
        }
        
        let s = Array(s)
        let len = s.count
        var dp = [Bool](repeating: false, count: len + 1)
        dp[0] = true
        
        for i in 1...len {
            for j in 0..<i {
                if dp[j] && wordDict.contains(String(s[j...(i - 1)])) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[len]
    }
    
    func test() {
        print(wordBreak("leetcode", ["leet", "code"]))
        print(wordBreak("applepenapple", ["apple", "pen"]))
        print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
    }
}
