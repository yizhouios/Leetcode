//
//  191.number-of-1-bits.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/18.
//

import Foundation

/*
 191. 位1的个数 (简单)
 https://leetcode-cn.com/problems/number-of-1-bits/
 */

class Solution_191 {
    // MARK: - x & (x - 1)可以去掉最右侧的1（此实现如果要算负数，需另外处理，可参考 Solution_461）
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var n = n
        
        while n != 0 {
            n &= (n - 1)
            ans += 1
        }
        
        return ans
    }
    
    // MARK: - 考虑负数
    func hammingWeight_v2(_ n: Int) -> Int {
        var ans = 0
        var mask = 1
        
        for _ in 0..<32 {
            if n & mask != 0 {
                ans += 1
            }
            
            mask <<= 1
        }
        
        return ans
    }
}
