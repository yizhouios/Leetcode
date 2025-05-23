//
//  139.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/26.
//

import Foundation

/*
 139. 单词拆分 (中等)
 https://leetcode.cn/problems/word-break/
 */

class Solution_139 {
    // MARK: - 动态规划（爬楼梯思路）
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.isEmpty || wordDict.isEmpty {
            return false
        }

        let count = s.count
        var dp = [Bool](repeating: false, count: count + 1)
        dp[0] = true

        for i in 1...count {
            for word in wordDict {
                let start = i - word.count
                if start < 0 {
                    continue
                }
                
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let endIndex = s.index(startIndex, offsetBy: word.count)
                let subString = String(s[startIndex..<endIndex])
                
                if subString == word && dp[start] {
                    dp[i] = true
                    break
                }
            }
        }

        return dp[count]
    }
}
