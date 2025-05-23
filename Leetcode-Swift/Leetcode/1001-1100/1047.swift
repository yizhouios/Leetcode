//
//  1047.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/19.
//

import Foundation

/*
 1047. 删除字符串中的所有相邻重复项 (简单)
 https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string/
 */

class Solution_1047 {
    func removeDuplicates(_ s: String) -> String {
        // 参数校验
        if s.isEmpty { return "" }
        
        // 将字符串转为字符数组
        let chs = Array(s)
        // 利用栈，依次消除重复项
        var stack = [Character]()
        for ch in chs {
            if stack.isEmpty {
                stack.append(ch)
                continue
            }
            
            if stack.last! == ch {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        
        return String(stack)
    }
}
