//
//  12_383.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/27.
//

import Foundation

/*
 383. 赎金信 (简单)
 https://leetcode-cn.com/problems/ransom-note/
 */

class Solution_383_3weeksDataStructures {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var nums = [Int](repeating: 0, count: 26)
        let unicodeValFora = Int("a".unicodeScalars.first!.value)

        for c in magazine.unicodeScalars {
            nums[Int(c.value) - unicodeValFora] += 1
        }
        
        for c in ransomNote.unicodeScalars {
            let index = Int(c.value) - unicodeValFora
            nums[index] -= 1
            if nums[index] == -1 {
                return false
            }
        }
        
        return true
    }
    
    func test() {
        print(canConstruct("a", "b"))
        print(canConstruct("aa", "ab"))
        print(canConstruct("aa", "aab"))
    }
}
