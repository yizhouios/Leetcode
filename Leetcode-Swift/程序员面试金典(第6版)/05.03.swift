//
//  05.03.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/7.
//

import Foundation

/*
 面试题 05.03. 翻转数位 (简单)
 https://leetcode.cn/problems/reverse-bits-lcci/
 */

class Solution_05_03 {
    // MARK: - 前缀后缀统计
    func reverseBits(_ num: Int) -> Int {
        var binarys = [Int](repeating: 0, count: 32)

        var mask = 1
        for i in 0..<32 {
            if num & mask != 0 {
                binarys[i] = 1
            }
            mask <<= 1
        }

        var maxLeftAndRight1Count = 0
        var counts = [Int](repeating: 0, count: 32)
        
        var pre = binarys[0]
        for i in 1..<32 {
            counts[i] = pre
            // 增加这个代码，考虑这种情况：2147483647
            maxLeftAndRight1Count = max(maxLeftAndRight1Count, pre)
            pre = binarys[i] == 0 ? 0 : pre + 1
        }
        
        pre = binarys[31]
        for i in (0...30).reversed() {
            counts[i] += pre
            maxLeftAndRight1Count = max(maxLeftAndRight1Count, counts[i])
            pre = binarys[i] == 0 ? 0 : pre + 1
        }

        return maxLeftAndRight1Count + 1
    }
}
