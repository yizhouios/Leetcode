//
//  17.11.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/2.
//

import Foundation

/*
 面试题 17.11. 单词距离 (中等)
 https://leetcode.cn/problems/find-closest-lcci/
 */

class Solution_17_11 {
    // MARK: - 一次遍历
    func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
        if words.isEmpty {
            return -1
        }

        var index1 = -1
        var index2 = -1
        var ans = words.count

        for (index, word) in words.enumerated() {
            if word == word1 {
                index1 = index
            } else if word == word2 {
                index2 = index
            }

            if index1 != -1 && index2 != -1 {
                ans = min(ans, abs(index1 - index2))
            }
        }

        return ans
    }
    
    // MARK: - 双指针
    func findClosest_v2(_ words: [String], _ word1: String, _ word2: String) -> Int {
        if words.isEmpty {
            return Int.max
        }

        var indexesOfWord1 = [Int]()
        var indexesOfWord2 = [Int]()
        for (index, word) in words.enumerated() {
            if word == word1 {
                indexesOfWord1.append(index)
            } else if (word == word2) {
                indexesOfWord2.append(index)
            }
        }

        if indexesOfWord1.isEmpty || indexesOfWord2.isEmpty {
            return Int.max
        }

        var ans = Int.max
        var p0 = 0, p1 = 0

        while p0 < indexesOfWord1.count && p1 < indexesOfWord2.count {
            let index0 = indexesOfWord1[p0]
            let index1 = indexesOfWord2[p1]

            ans = min(ans, abs(index0 - index1))

            if index0 >= index1 {
                p1 += 1
            } else {
                p0 += 1
            }
        }

        return ans
    }
}
