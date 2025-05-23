//
//  35_91_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/5.
//

import Foundation

/*
 91. 解码方法 (中等)
 https://leetcode-cn.com/problems/decode-ways/
 */

class Solution_35_91_Day20Plan {
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let map = [
            "1": "A", "2": "B", "3": "C", "4": "D", "5": "E", "6": "F",
            "7": "G", "8": "H", "9": "I", "10": "J", "11": "K", "12": "L",
            "13": "M", "14": "N", "15": "O", "16": "P", "17": "Q", "18": "R",
            "19": "S", "20": "T", "21": "U", "22": "V", "23": "W", "24": "X",
            "25": "Y", "26": "Z"
        ]
        let s: [String] = Array(s).map { "\($0)" }
        let len = s.count
        var dp = [Int](repeating: 0, count: len)
        if s[0] != "0" {
            dp[0] = 1
        }
        
        if s.count == 1 {
            return dp[0]
        }
        
        if s[1] != "0" {
            dp[1] = dp[0]
        }
        if map["\(s[0])\(s[1])"] != nil {
            dp[1] += 1
        }
        
        if s.count == 2 {
            return dp[1]
        }
        
        for i in 2..<len {
            if s[i - 1] == "0" {
                if dp[i - 1] != 0 {
                    if s[i] != "0" {
                        dp[i] = dp[i - 1]
                    }
                }
            } else {
                if s[i] == "0" {
                    if dp[i - 2] != 0 {
                        if s[i - 1] == "1" || s[i - 1] == "2" {
                            dp[i] = dp[i - 2]
                        }
                    }
                } else {
                    var all = dp[i - 1]
                    if dp[i - 2] != 0 && map["\(s[i - 1])\(s[i])"] != nil {
                        all += dp[i - 2]
                    }
                    dp[i] = all
                }
            }
        }
        
        return dp[len - 1]
    }
    
    func test() {
        print(numDecodings("0"))
        print(numDecodings("01"))
        print(numDecodings("10002"))
        

        print(numDecodings("10"))
        print(numDecodings("12"))
        print(numDecodings("102"))
        print(numDecodings("1010"))
        print(numDecodings("226"))
    }
}
