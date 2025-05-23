//
//  20.valid-parentheses.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/4.
//

import Foundation
/*
 20. 有效的括号 (简单)
 https://leetcode-cn.com/problems/valid-parentheses/
 */

class Solution_20 {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        let dict: [Character: Character] = [
            "(": ")",
            "[": "]",
            "{": "}"
            ]
        var stack = [Character]()
        for ch in s {
            if let _ = dict[ch] {
                // 如果是左括号入栈
                stack.append(ch)
            } else {
                // 如果是右括号，应该与栈顶的左括号进行匹配
                // 栈顶为空，直接返回false
                if stack.isEmpty {
                    return false
                }
                // 取出栈顶元素，判断是否和栈顶的左括号匹配
                let top = stack.removeLast()
                if let val = dict[top], val != ch {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
    
    func isValid_old(_ s: String) -> Bool {
        var stack: [Character] = []
        let dict: [Character : Character] = ["{":"}", "(":")", "[":"]"]
        for char in s {
            if dict[char] != nil {
                stack.append(char)
            } else {
                if dict[stack.last ?? "x"] == char {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }

    /*
     测试用例：
     1. 1个(左/右)、多个匹配，多个不匹配（奇数个数不匹配、偶数个数不匹配）
     2. 空
     */
    func test() {
        print(isValid("{"))
        print(isValid("]"))
        print(isValid("{]"))
        print(isValid("{}"))
        print(isValid("[]"))
        print(isValid("()"))
        print(isValid("{[()]}"))
        print(isValid("{{{}}}"))
        print(isValid("{{{[}}}"))
        print(isValid(""))
    }
}
