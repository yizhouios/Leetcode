//
//  1347.minimum-number-of-steps-to-make-two-strings-anagram.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/13.
//

import Foundation
/*
 1347. 制造字母异位词的最小步骤数 (中等)
 https://leetcode-cn.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/
 */

/*
 思路；
 1.
 */
class Solution1347 {
    func minSteps(_ s: String, _ t: String) -> Int {
        if s.count == 0 || t.count == 0 || s.count != t.count {
            return -1
        }
        var cnt = [Int](repeating: 0, count: 26)
        let sArray = Array(s)
        let tArray = Array(t)
        for i in 0..<sArray.count {
            let index1 = Int(sArray[i].unicodeScalars.first!.value - 97)
            let index2 = Int(tArray[i].unicodeScalars.first!.value - 97)
            cnt[index1] += 1
            cnt[index2] -= 1
        }
        cnt = cnt.map { (i) -> Int in
            i > 0 ? 0 : i
        }
        var replacedCount = cnt.filter { $0 < 0 }.reduce(0, +)
        var ans = 0
        for i in 0..<tArray.count {
            let index = Int(tArray[i].unicodeScalars.first!.value - 97)
            if cnt[index] < 0 {
                cnt[index] += 1
                replacedCount -= 1
                ans += 1
            }
            if replacedCount == 0 {
                break
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 一个；两个；多个字符（有相等的字符，均无相等的字符）
     2. 空字符串
     */
    func test() {
        print(minSteps("leetcode", "practice"))
        print(minSteps("bab", "aba"))
        print(minSteps("anagram", "mangaar"))
        
        print(minSteps("a", "a"))
        print(minSteps("a", "b"))
        print(minSteps("ab", "ab"))
        print(minSteps("ab", "de"))
        print(minSteps("anagram", "xxxxxxm"))
        print(minSteps("anagram", "xxxxxxx"))
        
        print(minSteps("", ""))
        print(minSteps("", "s"))
        print(minSteps("s", ""))
    }
}
