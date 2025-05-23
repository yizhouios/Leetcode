//
//  56.1.shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/28.
//

import Foundation

/*
 剑指 Offer 56 - I. 数组中数字出现的次数 (中等)
 https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/
 */

class Solution_Offer_56_1 {
    // MARK: - 位运算（分组异或）
    func singleNumbers(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return []
        }

        var xorVal = 0
        for i in nums {
            xorVal ^= i
        }

        if xorVal == 0 {
            return []
        }

        var tag = 1
        while (xorVal & tag) == 0 {
            tag <<= 1
        }

        var ans1 = 0
        var ans2 = 0
        for i in nums {
            if (i & tag) == 0 {
                ans1 ^= i
            } else {
                ans2 ^= i
            }
        }

        return [ans1, ans2]
    }
}
