//
//  08_844_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/25.
//

import Foundation

/*
 844. 比较含退格的字符串 (简单)
 https://leetcode-cn.com/problems/backspace-string-compare/
 */

class Solution_08_844_Day20Plan {
    
    /// 法2：双指针
    /// 时间复杂度：O(m + n)
    /// 空间复杂度：O(1)
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        let t = Array(t)
        var sIndex = s.count - 1
        var tIndex = t.count - 1
        var poundSignS = 0
        var poundSignT = 0
        
        while sIndex >= 0 || tIndex >= 0 {
            while sIndex >= 0 {
                if s[sIndex] == "#" {
                    poundSignS += 1
                    sIndex -= 1
                } else if poundSignS > 0 {
                    poundSignS -= 1
                    sIndex -= 1
                } else {
                    break
                }
            }
            
            while tIndex >= 0 {
                if t[tIndex] == "#" {
                    poundSignT += 1
                    tIndex -= 1
                } else if poundSignT > 0 {
                    poundSignT -= 1
                    tIndex -= 1
                } else {
                    break
                }
            }
            
            if sIndex >= 0 && tIndex >= 0 {
                if s[sIndex] != t[tIndex] {
                    return false
                }
            } else if sIndex >= 0 || tIndex >= 0 {
                return false
            }
            
            sIndex -= 1
            tIndex -= 1
        }
        
        return true
    }
    
    /// 法一：利用栈，重构字符串
    /// 时间复杂度：O(m + n)
    /// 空间复杂度：O(m + n)
    func backspaceCompare_1(_ s: String, _ t: String) -> Bool {
        func reCreateString(_ s: String) -> String {
            var newS = [Character]()
            for i in s {
                if i != "#" {
                    newS.append(i)
                } else if !newS.isEmpty {
                    newS.removeLast()
                }
            }
            return String(newS)
        }
        
        return reCreateString(s) == reCreateString(t)
    }
    
    func test() {
        print(backspaceCompare("ab#c", "ab#c"))
        print(backspaceCompare("ab##", "c#d#"))
        print(backspaceCompare("a##c", "#a#c"))
        print(backspaceCompare("a#c", "b"))
        print(backspaceCompare("xywrrmp", "xywrrmu#p"))
    }
}
