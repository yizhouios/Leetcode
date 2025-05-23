//
//  05.06.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/8.
//

import Foundation

/*
 面试题 05.06. 整数转换 (简单)
 https://leetcode.cn/problems/convert-integer-lcci/
 */

class Solution_05_06 {
    // MARK: - x & (x - 1)可以去掉最右侧的1（需要针对负数做单独处理）
    func convertInteger(_ A: Int, _ B: Int) -> Int {
        if A == B {
            return 0
        }

        var xorVal = A ^ B
        var ans = 0

        while xorVal != 0 {
            if xorVal == Int32.min {
                ans += 1
                break
            }

            xorVal &= (xorVal - 1)
            ans += 1
        }

        return ans
    }
    
    // MARK: - 通过掩码计算每个位
    func convertInteger_v2(_ A: Int, _ B: Int) -> Int {
        let xorVal = A ^ B
        var ans = 0
        var mask = 1
        
        for _ in 0..<32 {
            if xorVal & mask != 0 {
                ans += 1
            }
            
            mask <<= 1
        }
        
        return ans
    }
}
