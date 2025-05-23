//
//  461.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/6/8.
//

import Foundation

/*
 461. 汉明距离 (简单)
 https://leetcode.cn/problems/hamming-distance/
 */

class Solution_461 {
    // MARK: - x & (x - 1)可以去掉最右侧的1（需要针对负数做单独处理）
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xorVal = x ^ y
        var ans = 0

        while xorVal != 0 {
            xorVal &= (xorVal - 1)
            ans += 1
        }

        return ans
    }
    
    // MARK: - 考虑负数
    func hammingDistance_v2(_ x: Int, _ y: Int) -> Int {
        let xorVal = x ^ y
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
