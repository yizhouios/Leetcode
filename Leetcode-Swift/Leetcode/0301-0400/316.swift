//
//  316.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/25.
//

import Foundation

/*
 316. 去除重复字母 (中等)
 https://leetcode-cn.com/problems/remove-duplicate-letters/
 
 题解参考：
 1. https://leetcode-cn.com/problems/remove-duplicate-letters/solution/you-qian-ru-shen-dan-diao-zhan-si-lu-qu-chu-zhong-/
 2. https://leetcode-cn.com/problems/remove-duplicate-letters/solution/qu-chu-zhong-fu-zi-mu-by-leetcode-soluti-vuso/
 */

/*
 给定一个字符串 ss，如何去掉其中的一个字符 ch，使得得到的字符串字典序最小呢？
 答案是：找出最小的满足 s[i]>s[i+1] 的下标 i，并去除字符 s[i]。并称这样的字符为「关键字符」。
 */

class Solution_316 {
    func removeDuplicateLetters(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        
        var letterCountDict: [Character: Int] = Dictionary()
        for i in s {
            letterCountDict[i, default: 0] += 1
        }
        
        let letters = Array(s)
        let count = letters.count
        var ansStack = [Character]()
        var letterExistDict: [Character: Bool] = Dictionary()
        
        for index in 0..<count {
            let c = letters[index]
            letterCountDict[c]! -= 1
            
            if let exist = letterExistDict[c], exist == true {
                continue
            }
            
            while !ansStack.isEmpty {
                let stackEndChar = ansStack.last!
                if stackEndChar > c && letterCountDict[stackEndChar]! != 0 {
                    letterExistDict[stackEndChar] = false
                    ansStack.removeLast()
                } else {
                    break
                }
            }
            ansStack.append(c)
            letterExistDict[c] = true
        }
        
        return String(ansStack)
    }
    
    func test() {
        print(removeDuplicateLetters("bcabc"))
        print(removeDuplicateLetters("cbacdcbc"))
        
        print(removeDuplicateLetters("ecbacba")) // "eacb"
    }
}
