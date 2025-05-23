//
//  26_17_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/1.
//

import Foundation

/*
 17. 电话号码的字母组合 (中等)
 https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/
 */

class Solution_26_17_Day20Plan {
    /// 深度优先搜索
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        
        let digitsMap = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        func dfs(_ digits: String) -> [String] {
            if digits.isEmpty {
                return []
            }
            
            if digits.count == 1 {
                return digitsMap[digits]!
            }
            
            var res = [String]()
            let first = String(digits[digits.startIndex])
            let other = dfs(String(digits[digits.index(after: digits.startIndex)...]))
            for i in digitsMap[first]! {
                for j in other {
                    res.append("\(i)\(j)")
                }
            }
            
            return res
        }
        
        return dfs(digits)
    }
    
    func test() {
        print(letterCombinations("23"))
        print(letterCombinations(""))
        print(letterCombinations("2"))
    }
}
