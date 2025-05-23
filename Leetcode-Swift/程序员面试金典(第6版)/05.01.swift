//
//  05.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/9.
//

import Foundation

/*
 面试题 05.01. 插入 (简单)
 https://leetcode.cn/problems/insert-into-bits-lcci/
 */

class Solution_05_01 {
    // MARK: - 或者M中每个二进制位的值，直接设置到原数中
    func insertBits(_ N: Int, _ M: Int, _ i: Int, _ j: Int) -> Int {
        var N = N
        for k in i...j {
            let cur = M & (1 << (k - i))
            if cur == 0 {
                N &= ~(1 << k)
            } else {
                N |= (1 << k)
            }
        }

        return N
    }
    
    // MARK: - 通过将数字转为二进制位对应的数组，通过数组进行替换，然后将数组再转换整数
    func insertBits_v2(_ N: Int, _ M: Int, _ i: Int, _ j: Int) -> Int {
        var nBits = [Int](repeating: 0, count: 32)
        var mBits = [Int](repeating: 0, count: 32)
        
        var mask = 1
        for i in 0..<32 {
            if (N & mask) != 0 {
                nBits[i] = 1
            }
            mask <<= 1
        }
        
        mask = 1
        for i in 0..<32 {
            if (M & mask) != 0 {
                mBits[i] = 1
            }
            mask <<= 1
        }
        
        for k in i...j {
            nBits[k] = mBits[k - i]
        }
        
        var ans = 0
        mask = 1
        for i in 0..<32 {
            ans = ans + (nBits[i] * mask)
            mask <<= 1
        }
        
        return ans
    }
}
