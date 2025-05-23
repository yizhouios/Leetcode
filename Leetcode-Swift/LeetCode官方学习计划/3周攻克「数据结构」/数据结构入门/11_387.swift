//
//  11_387.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/27.
//

import Foundation

/*
 387. 字符串中的第一个唯一字符 (简单)
 https://leetcode-cn.com/problems/first-unique-character-in-a-string/
 */

class Solution_387_3weeksDataStructures {
    func firstUniqChar(_ s: String) -> Int {
        var nums = [Int](repeating: 0, count: 26)
        let ascIIValue = Int("a".unicodeScalars.first!.value)

        for c in s.unicodeScalars {
            nums[Int(c.value) - ascIIValue] += 1
        }

        var res = 0
        for c in s.unicodeScalars {
            if nums[Int(c.value) - ascIIValue] == 1 {
                return res
            }
            res += 1
        }

        return -1
    }
    
    /// 利用哈希表
    func firstUniqChar_1(_ s: String) -> Int {
        if s.isEmpty {
            return -1
        }
        
        var dict = [Character: Int]()
        let s = Array(s)
        for (index, val) in s.enumerated() {
            if dict[val] != nil {
                dict[val] = -1
            } else {
                dict[val] = index
            }
        }
        
        for i in s {
            if dict[i] != -1 {
                return dict[i]!
            }
        }
        
        return -1
    }
    
    func test() {
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}
