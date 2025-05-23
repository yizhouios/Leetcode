//
//  16.02.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 面试题 16.02. 单词频率 (中等)
 https://leetcode-cn.com/problems/words-frequency-lcci/
 */

class Solution_Jindian_1602 {
    class WordsFrequency {
        
        var map = [String: Int]()
        
        init(_ book: [String]) {
            for i in book {
                map[i, default: 0] += 1
            }
        }
        
        func get(_ word: String) -> Int {
            if let frequency = map[word] {
                return frequency
            }
            return 0
        }
    }
}
