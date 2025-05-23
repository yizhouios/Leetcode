//
//  11_438_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/26.
//

import Foundation

/*
 438. 找到字符串中所有字母异位词 (中等)
 https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/
 */

class Solution_11_438_Day20Plan {
    /// 思路：滑动窗口 + 双指针
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.isEmpty || p.isEmpty || s.count < p.count {
            return []
        }
        
        let sArray = s.map { c in
            return Int(c.unicodeScalars.first!.value) - 97
        }
        let pArray = p.map { c in
            return Int(c.unicodeScalars.first!.value) - 97
        }
        let sLen = sArray.count
        let pLen = pArray.count
        var sCnt = [Int](repeating: 0, count: 26)
        var pCnt = [Int](repeating: 0, count: 26)
        var ans = [Int]()
        
        for i in pArray {
            pCnt[i] += 1
        }
        
        var left = 0
        for right in 0..<sLen {
            let char = sArray[right]
            sCnt[char] += 1
            while sCnt[char] > pCnt[char] {
                sCnt[sArray[left]] -= 1
                left += 1
            }
            if right - left + 1 == pLen {
                ans.append(left)
            }
        }
        
        return ans
    }
    
    /// 思路：滑动窗口 + 数组
    func findAnagrams_1(_ s: String, _ p: String) -> [Int] {
        if s.isEmpty || p.isEmpty || s.count < p.count {
            return []
        }
        
        let sArray = s.map { c in
            return Int(c.unicodeScalars.first!.value) - 97
        }
        let pArray = p.map { c in
            return Int(c.unicodeScalars.first!.value) - 97
        }
        let sLen = sArray.count
        let pLen = pArray.count
        var sCnt = [Int](repeating: 0, count: 26)
        var pCnt = [Int](repeating: 0, count: 26)
        var ans = [Int]()
        
        for i in 0..<pLen {
            sCnt[sArray[i]] += 1
            pCnt[pArray[i]] += 1
        }
        if sCnt == pCnt {
            ans.append(0)
        }
        
        for i in pLen..<sLen {
            sCnt[sArray[i]] += 1
            sCnt[sArray[i - pLen]] -= 1
            if sCnt == pCnt {
                ans.append(i - pLen + 1)
            }
        }
        
        return ans
    }
    
    func test() {
        print(findAnagrams("cbaebabacd", "abc"))
    }
}
