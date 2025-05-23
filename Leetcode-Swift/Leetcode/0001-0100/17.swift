//
//  17.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/30.
//

import Foundation

/*
 17. 电话号码的字母组合 (中等)
 https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/
 */

class Solution_17 {
    let dict: [String: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    var ans = [String]()

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }

        var path = [String]()
        letterCombinationsCore(digits.map{ String($0) }, 0, &path)

        return ans
    }

    func letterCombinationsCore(_ ditits: [String], _ k: Int, _ path: inout [String]) {
        if k >= ditits.count {
            ans.append(path.joined())
            return
        }

        guard let items = dict[ditits[k]] else {
            return
        }

        for i in items {
            path.append(i)
            letterCombinationsCore(ditits, k + 1, &path)
            path.removeLast()
        }
    }
}
