//
//  38.zi-fu-chuan-de-pai-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/16.
//

import Foundation

/*
 剑指 Offer 38. 字符串的排列 (中等)
 https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/
 */

class Solution_Offer_38 {
    func permutation(_ s: String) -> [String] {
        if s.count == 0 {
            return []
        }
        
        if s.count == 1 {
            return [s]
        }
        
        var s = Array(s)
        var ans = [String]()
        var dict = [Character: Bool]()
    
        for index in 0...(s.count - 1) {
            let i = s[index]
            if dict[i] == nil {
                dict[i] = true
                
                var tmp = i
                s[index] = s.first!
                s[0] = tmp
                
                for j in permutation(String(s[1...])) {
                    ans.append([s[0]] + j)
                }
                
                tmp = s[index]
                s[index] = s[0]
                s[0] = tmp
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：串中字母都不等；有等有不等；都等
     2. 特殊输入测试：空串、只有1个字符的串
     */
    func test() {
        print(permutation("abcde"))
        print(permutation("aac"))
        print(permutation("aaa"))
        print(permutation("a"))
        print(permutation(""))
    }
}
