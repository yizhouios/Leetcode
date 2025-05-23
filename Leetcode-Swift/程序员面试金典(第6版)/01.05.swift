//
//  01.05.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 面试题 01.05. 一次编辑 (中等)
 https://leetcode-cn.com/problems/one-away-lcci/
 */

class Solution_jindian_0105 {
    func oneEditAway(_ first: String, _ second: String) -> Bool {
        // 入参校验
        let m = first.count
        let n = second.count
        if (m - n) >= 2 || (n - m) >= 2 {
            return false
        }
        
        let firstArray = Array(first)
        let secondArray = Array(second)
        var edited = false
        var i = 0
        var j = 0
        
        // 依次比对每个字符
        while i < m && j < n {
            // 当前字符不一样
            if firstArray[i] != secondArray[j] {
                // 如果已经编辑过，直接返回false
                if edited {
                    return false
                }
            
                if m > n { // 删除当前不匹配的first中的字符
                    i += 1
                } else if n > m { // 删除当前不匹配的second中的字符
                    j += 1
                } else { // 如果m==n，进行替换
                    i += 1
                    j += 1
                }
                
                // 标记为已编辑
                edited = true
            } else {
                i += 1
                j += 1
            }
        }

        return true
    }
    
    func test() {
        print("test")
    }
}
