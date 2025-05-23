//
//  49.group-anagrams.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/8.
//

import Foundation
/*
 49. 字母异位词分组 (中等)
 https://leetcode-cn.com/problems/group-anagrams/
 */

class Solution49 {
    

    // 排序+哈希表
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()

        for str in strs {
            let key = str.sorted()
            map[String(key), default: []].append(str)
        }

        return Array(map.values)
    }
    
    /*
     思路：计数。根据字符串中字母的计数作为key，来存储相同的字母异位词。
     */
    func groupAnagrams_1(_ strs: [String]) -> [[String]] {
        guard strs.count > 0 else {
            return []
        }
        var resDict: [String : [String]] = [:]
        let a = Int("a".unicodeScalars.first!.value)
        for s in strs {
            var count = Array(repeating: 0, count: 26)
            for c in s {
                let index = Int(c.unicodeScalars.first!.value) - a
                count[index] += 1
            }
            
            var key = ""
            for i in 0..<26 {
                if count[i] != 0 {
                    key.append("\(Character(Unicode.Scalar(97 + i)!))\(count[i])")
                }
            }
            guard let _ = resDict[key] else {
                resDict[key] = [s]
                continue
            }
            resDict[key]?.append(s)
        }
        
        return Array(resDict.values)
    }
    
    /*
     思路：排序
     时间复杂度: nklogk
     空间复杂度: nk
     */
    func groupAnagrams_self(_ strs: [String]) -> [[String]] {
        if strs.count == 0 {
            return []
        }
        
        var resDict: [String : [String]] = [:]
        for str in strs {
            let sortedStr = String(str.sorted())
            guard let _ = resDict[sortedStr] else {
                resDict[sortedStr] = [String(str)]
                continue
            }
            resDict[sortedStr]?.append(String(str))
        }
        return Array(resDict.values)
    }
    
    /*
     测试用例：
     1. 两个元素：是字母异位词；不是字母异位词
     2. 多个元素：多个字母异位词
     3. 1个元素
     4. 空元素
     */
    func test() {
        print(groupAnagrams(["abc", "bca"]))
        print(groupAnagrams(["abc", "bdsfa"]))
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
        print(groupAnagrams(["a"]))
        print(groupAnagrams([]))
    }
}
