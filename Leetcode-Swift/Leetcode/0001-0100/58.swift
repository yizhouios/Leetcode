//
//  58.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/1.
//

import Foundation

/*
 58. 最后一个单词的长度 (简单)
 https://leetcode-cn.com/problems/length-of-last-word/
 */

class Solution_58 {
    
    /*
     优化
     */
    func lengthOfLastWord(_ s: String) -> Int {
        var ans = 0
        for c in s.reversed() {
            if c != " " {
                ans += 1
            } else if ans > 0 {
                return ans
            }
        }
        return ans
    }
    
    func lengthOfLastWord_self(_ s: String) -> Int {
        // 如果为空，直接返回0
        if s.isEmpty {
            return 0
        }
        
        let array = Array(s)
        // 计算最后一个单词的最右索引
        var end = array.count - 1
        while end >= 0 {
            if array[end] == " " {
                end -= 1
            } else {
                break
            }
        }
        
        if end < 0 {
            return 0
        }
        
        var begin = end - 1
        while begin >= 0 {
            if array[begin] != " " {
                begin -= 1
            } else {
                break
            }
        }
        
        return end - begin
    }
    
    func test() {
        print(lengthOfLastWord("     "))
        print(lengthOfLastWord("   fly me   to   the moon  "))
        print(lengthOfLastWord("luffy is still joyboy"))
    }
}
