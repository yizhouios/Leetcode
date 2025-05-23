//
//  10.02.group-anagrams-lcci.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/13.
//

import Foundation
/*
 面试题 10.02. 变位词组 (中等)
 https://leetcode-cn.com/problems/group-anagrams-lcci/
 */

/*
 参考leetcode 49
 */
class Solution_Jindian_10_02 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let aUnicodeValue = Int("a".unicodeScalars.first!.value)
        var strDic = [[Int]: [String]]()
        
        for str in strs {
            var alphabet = [Int](repeating: 0, count: 26)
            for unicode in str.unicodeScalars {
                alphabet[Int(unicode.value) - aUnicodeValue] += 1
            }
            strDic[alphabet, default: []].append(str)
        }
        return Array(strDic.values)
    }
    
    func test() {
        
    }
}
