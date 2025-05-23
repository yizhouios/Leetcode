//
//  242.valid-anagram.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/7.
//

import Foundation
/*
 242. 有效的字母异位词 (简单)
 https://leetcode-cn.com/problems/valid-anagram/
 */

class Solution242 {
    
    // 构建字符unicode值数组，然后排序，判断排序后的两个数组是否相等
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var sUnicodeVals = [UInt32](repeating: 0, count: s.count)
        var tUnicodeVals = [UInt32](repeating: 0, count: t.count)

        for (idx, ch) in s.enumerated() {
            sUnicodeVals[idx] = ch.unicodeScalars.first!.value
        }
        for (idx, ch) in t.enumerated() {
            tUnicodeVals[idx] = ch.unicodeScalars.first!.value
        }
        
        // 将字符对应的unicode值数组排序
        sUnicodeVals.sort()
        tUnicodeVals.sort()
        
        return sUnicodeVals.elementsEqual(tUnicodeVals)
    }
    
    // 利用数组，第一次遍历增加每个字母出现的次数，第二次遍历减去对应字母的出现次数；最后判断每个字母是否为0，如果有一个不为0，代表不是异位词。
    func isAnagram_1(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        let a = Int("a".unicodeScalars.first!.value)
        var counter = [Int](repeating: 0, count: 26)
        for index in s.unicodeScalars {
            counter[Int(index.value)-a] += 1
        }
        for index in t.unicodeScalars {
            counter[Int(index.value)-a] -= 1
        }
        for (_,n) in counter.enumerated() {
            if n > 0 {
                return false
            }
        }
        return true
    }
    
    // 自写：利用哈希表记录字母个数
    func isAnagram_2(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var map = [Character: Int]()

        for c in Array(s) {
            map[c, default: 0] += 1
        }

        for c in Array(t) {
            if let count = map[c] {
                map[c] = count - 1
            } else {
                return false
            }
        }

        for val in map.values {
            if val != 0 {
                return false
            }
        }

        return true
    }
    
    /*
     测试用例：
     1. 个数相等：1、2、多个
     2. 个数不等
     3. 空字符串
     */
    func test() {
        print(isAnagram("a", "a"))
        print(isAnagram("ba", "ab"))
        print(isAnagram("anagram", "nagaram"))
        print(isAnagram("a", "abbb"))
        print(isAnagram("", ""))
        
        // 出错用例
        print(isAnagram("aacc", "ccac"))
    }
}
