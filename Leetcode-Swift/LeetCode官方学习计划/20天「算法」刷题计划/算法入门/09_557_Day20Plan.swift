//
//  557_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/12.
//

import Foundation

/*
 557. 反转字符串中的单词 III (简单)
 https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/solution/fan-zhuan-zi-fu-chuan-zhong-de-dan-ci-iii-by-lee-2/
 */

class Solution_557_Day20Plan {
    /// 双指针：优化
    func reverseWords(_ s: String) -> String {
        var s = Array(s)
        let len = s.count
        var i = 0
        
        while i < len {
            let start = i
            // 找当前单词的末尾
            while i < len && s[i] != " " {
                i += 1
            }
            
            // 单词翻转
            var left = start, right = i - 1
            while left < right {
                s.swapAt(left, right)
                left += 1
                right -= 1
            }
            
            // 找下个单词的开头
            while i < len && s[i] == " " {
                i += 1
            }
        }
        
        return String(s)
    }
    
    /// 双指针：初版
    func reverseWords_1(_ s: String) -> String {
        let len = s.count
        var s = Array(s)
        var wordBeginIndex = 0
        while wordBeginIndex < len {
            if s[wordBeginIndex] != " " {
                var wordEndIndex = wordBeginIndex
                while wordEndIndex < len && s[wordEndIndex] != " " {
                    wordEndIndex += 1
                }
                var left = wordBeginIndex
                var right = wordEndIndex - 1
                while left < right {
                    s.swapAt(left, right)
                    left += 1
                    right -= 1
                }
                wordBeginIndex = wordEndIndex
            } else {
                wordBeginIndex += 1
            }
        }
        return String(s)
    }
    
    func test() {
        print(reverseWords(" Let's take LeetCode contest"))
        print(reverseWords("Let's take LeetCode contest"))
        print(reverseWords(" Let's "))
    }
}
