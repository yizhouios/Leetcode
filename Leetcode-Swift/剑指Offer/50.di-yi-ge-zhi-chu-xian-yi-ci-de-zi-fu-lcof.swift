//
//  50.di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/23.
//

import Foundation

/*
 剑指 Offer 50. 第一个只出现一次的字符 (简单)
 https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
 */

class Solution_Offer_50 {
    func firstUniqChar(_ s: String) -> Character {
        if s.count == 0 {
            return " "
        }
        
        var ans = [Int](repeating: 0, count: 26)
        for i in s {
            ans[Int(i.unicodeScalars.first!.value) - 97] += 1
        }
        for (_, i) in s.enumerated() {
            if ans[Int(i.unicodeScalars.first!.value) - 97] == 1 {
                return i
            }
        }
        return " "
    }
    
    /*
     测试用例
     1. 功能测试：无出现一次的字符；出现在第1个位置、中间位置、最后；
     2. 特殊输入测试：空串；就1个字符的串
     */
    func test() {
        print(firstUniqChar("aabbcc"))
        print(firstUniqChar("aabbcddee"))
        print(firstUniqChar("caabbddee"))
        print(firstUniqChar("aabbddeec"))
        print(firstUniqChar("abaccdeff"))
        print(firstUniqChar(""))
        print(firstUniqChar("a"))
        
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("zabd"))
    }
}
