//
//  438.find-all-anagrams-in-a-string.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/12.
//

import Foundation
/*
 438. 找到字符串中所有字母异位词 (中等)
 https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/
 */

class Solution438 {
    // MARK: - 滑动窗口 + 双指针
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
        for i in pArray {
            pCnt[i] += 1
        }
        
        var ans = [Int]()
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
    
    // MARK: - 滑动窗口+数组
    func findAnagrams_v1(_ s: String, _ p: String) -> [Int] {
        if s.count == 0 || p.count == 0 || s.count < p.count {
            return []
        }
        
        var sCnt: [Int] = [Int](repeating: 0, count: 26)
        var pCnt: [Int] = [Int](repeating: 0, count: 26)
        let sArray = Array(s)
        let pArray = Array(p)
        let sCount = sArray.count
        let pCount = pArray.count
        
        for i in 0..<pCount {
            sCnt[Int(sArray[i].unicodeScalars.first!.value) - 97] += 1
            pCnt[Int(pArray[i].unicodeScalars.first!.value) - 97] += 1
        }
        
        var ans: [Int] = []
        if sCnt == pCnt {
            ans.append(0)
        }
        
        for i in pCount..<sCount {
            sCnt[Int(sArray[i - pCount].unicodeScalars.first!.value) - 97] -= 1
            sCnt[Int(sArray[i].unicodeScalars.first!.value) - 97] += 1
            
            if sCnt == pCnt {
                ans.append(i - pCount + 1)
            }
        }
        
        return ans
    }
}
