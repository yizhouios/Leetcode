//
//  387.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/27.
//

import Foundation

/*
 387. 字符串中的第一个唯一字符 (简单)
 https://leetcode-cn.com/problems/first-unique-character-in-a-string/
 */

class Solution_387 {
    /// 方法二：用哈希表记录索引
    func firstUniqChar(_ s: String) -> Int {
        if s.isEmpty {
            return -1
        }
        
        var dict: [Character: Int] = Dictionary()
        for i in s {
          dict[i, default: 0] += 1
        }
        
        for (index, i) in s.enumerated() {
            if dict[i] == 1 {
                return index
            }
        }
        
        return -1
    }
    
    /// 方法一：用哈希表记录次数
    func firstUniqChar_1(_ s: String) -> Int {
        if s.isEmpty {
            return -1
        }
        
        var dict: [Character: Int] = Dictionary()
        for i in s {
          dict[i, default: 0] += 1
        }
        
        for (index, i) in s.enumerated() {
            if dict[i] == 1 {
                return index
            }
        }
        
        return -1
    }
    
    func test() {
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}
