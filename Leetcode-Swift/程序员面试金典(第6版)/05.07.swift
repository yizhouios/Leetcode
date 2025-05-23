//
//  05.07.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/9.
//

import Foundation

/*
 面试题 05.07. 配对交换 (简单)
 https://leetcode.cn/problems/exchange-lcci/
 */

class Solution_05_07 {
    // MARK: - 位运算，遍历num/2次
    func exchangeBits(_ num: Int) -> Int {
        var ans = 0
        
        for i in stride(from: 0, to: 32, by: 2) {
            let odd = num & (1 << i)
            let even = num & (1 << (i + 1))
            
            if odd != 0 {
                ans |= (1 << (i + 1))
            }
            if even != 0 {
                ans |= (1 << i)
            }
        }

        return ans
    }
}
