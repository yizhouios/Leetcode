//
//  191_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/20.
//

import Foundation

/*
 191. 位1的个数 (简单)
 https://leetcode-cn.com/problems/number-of-1-bits/
 */

class Solution191_Day20Plan {
    // 优化
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var n = n
        while n != 0 {
            n = n & (n - 1) // 去除最右边的1
            ans += 1
        }
        return ans
    }
    
    // 自写
    func hammingWeight_1(_ n: Int) -> Int {
        var n = n
        var ans = 0
        var bit = 1
        while n != 0 {
            if n & bit > 0 {
                ans += 1
            }
            n = n & (~bit)
            bit <<= 1
        }
        
        return ans
    }
    
    func test() {
        print(hammingWeight(0))
        print(hammingWeight(1))
        print(hammingWeight(0b00000000000000000000000000001011))
        print(hammingWeight(0b00000000000000000000000010000000))
        print(hammingWeight(0b11111111111111111111111111111101))
    }
}
