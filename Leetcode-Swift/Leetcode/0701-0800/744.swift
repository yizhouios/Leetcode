//
//  744.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/28.
//

import Foundation

/*
 744. 寻找比目标字母大的最小字母 (简单)
 https://leetcode-cn.com/problems/find-smallest-letter-greater-than-target/
 */

class Solution_744 {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        // 参数校验
        if letters.isEmpty {
            return Character("")
        }

        var low = 0
        var high = letters.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            if letters[mid] > target { // 如果当前字符大于目标字符
                if mid == 0 || letters[mid - 1] <= target { // 找到了
                    return letters[mid]
                } else { // 前一个也大于目标字符，缩小右区间
                    high = mid - 1
                }
            } else { // 当前字符不大于目标字符
                low = mid + 1
            }
        }
        
        return letters[0]
    }
}
