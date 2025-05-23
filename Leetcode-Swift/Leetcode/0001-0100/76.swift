//
//  76.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/19.
//

import Foundation

/*
 76. 最小覆盖子串 (困难)
 https://leetcode.cn/problems/minimum-window-substring/
 */

class Solution_76 {
    // MARK: - 滑动窗口+双指针
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty || t.count > s.count {
            return ""
        }

        let arrayS: [Character] = Array(s)
        let arrayT: [Character] = Array(t)

        var tMap: [Character: Int] = [:]
        for i in arrayT {
            tMap[i, default: 0] += 1
        }

        let windowMinCount = arrayT.count
        var coverCount = 0
        var ansLeft = -1, ansRight = -1
        var left = 0
        for (right, charS) in arrayS.enumerated() {
            if tMap[charS] == nil {
                continue
            }

            // 每匹配到一个，字典中对应的字符的个数就减1
            let newCharSCount = tMap[charS]! - 1
            tMap[charS] = newCharSCount
            
            // 增加覆盖模式串的个数（如果newCharSCount小于0，代表匹配了超过charS的最少个数，不用增加coverCount）
            if newCharSCount >= 0 {
                coverCount += 1
            }

            if coverCount == windowMinCount {
                while (right - left + 1) >= windowMinCount {
                    let leftCharOfS = arrayS[left]

                    // 如果最左侧字符不在模式串里，那么窗口可以缩小
                    if tMap[leftCharOfS] == nil {
                        left += 1
                        continue
                    }
                    
                    // 如果最左侧字符是多余匹配的，那么窗口可以缩小
                    if tMap[leftCharOfS]! < 0 {
                        tMap[leftCharOfS] = tMap[leftCharOfS]! + 1
                        left += 1
                        continue
                    }

                    break
                }

                if (ansLeft == -1 && ansRight == -1) || (ansRight - ansLeft) > (right - left) {
                    ansLeft = left
                    ansRight = right
                }
            }
        }

        return (ansLeft >= 0 && ansRight >= 0) ? String(arrayS[ansLeft...ansRight]) : ""
    }
}
