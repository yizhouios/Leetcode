//
//  13_242.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/27.
//

import Foundation

/*
 242. 有效的字母异位词 (简单)
 https://leetcode-cn.com/problems/valid-anagram/
 */

class Solution_242_3weeksDataStructures {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var nums = [Int](repeating: 0, count: 26)
        let unicodeValFora = Int("a".unicodeScalars.first!.value)

        for c in s.unicodeScalars {
            nums[Int(c.value) - unicodeValFora] += 1
        }
        for c in t.unicodeScalars {
            nums[Int(c.value) - unicodeValFora] -= 1
        }
        for i in nums {
            if i != 0 {
                return false
            }
        }
        return true
    }
    
    func test() {
        print(isAnagram("anagram", "nagaram"))
        print(isAnagram("rat", "car"))
    }
}
