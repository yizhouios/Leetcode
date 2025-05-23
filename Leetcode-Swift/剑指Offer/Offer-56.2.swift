//
//  56.2.shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/29.
//

import Foundation

/*
 剑指 Offer 56 - II. 数组中数字出现的次数 II (中等)
 https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/
 */

class Solution_Offer_56_2 {
    // MARK: - 位运算（算每个位的个数，然后取余3）
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var counts = [Int](repeating: 0, count: 32)
        for i in nums {
            var mask = 1
            for j in 0...31 {
                if (i & mask) != 0 {
                    counts[j] = (counts[j] + 1) % 3
                }
                mask <<= 1
            }
        }
        
        var ans = 0
        for i in 0...31 {
            if counts[i] != 0 {
                ans |= (1 << i)
            }
        }
        
        return ans
    }
}
