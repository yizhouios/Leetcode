//
//  784_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/18.
//

import Foundation

/*
 784. 字母大小写全排列 (中等)
 https://leetcode-cn.com/problems/letter-case-permutation/
 */

class Solution_784_Day20Plan {
    func letterCasePermutation(_ s: String) -> [String] {
        if s.isEmpty {
            return []
        }
        
        let s: [Character] = Array(s)
        let len = s.count
        var ans = [String]()
        
        for i in 0..<len {
            if s[i].isNumber {
                if ans.isEmpty {
                    ans.append("\(s[i])")
                } else {
                    ans = ans.map { str in
                        "\(str)\(s[i])"
                    }
                }
            } else {
                if ans.isEmpty {
                    ans.append("\(s[i])")
                    ans.append("\(s[i].isLowercase ? Character(Unicode.Scalar(s[i].asciiValue! - 32)) : Character(Unicode.Scalar(s[i].asciiValue! + 32)))")
                } else {
                    var ans1 = ans
                    var ans2 = ans
                    ans1 = ans.map({ str in
                        "\(str)\(s[i])"
                    })
                    ans2 = ans.map({ str in
                        "\(str)\(s[i].isLowercase ? Character(Unicode.Scalar(s[i].asciiValue! - 32)) : Character(Unicode.Scalar(s[i].asciiValue! + 32)))"
                    })
                    ans = ans1 + ans2
                }
                
            }
        }
        
        return ans
    }
    
    func test() {
        print(letterCasePermutation("a1b2"))
        print(letterCasePermutation("3z4"))
        print(letterCasePermutation("12345"))
    }
}
