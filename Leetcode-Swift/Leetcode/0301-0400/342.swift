//
//  342.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/5.
//

import Foundation

/*
 342. 4的幂 (简单)
 https://leetcode-cn.com/problems/power-of-four/
 
 思路：
 1. 循环
 2. 二进制表示中1的位置：
    * n的二进制中只有1个1，且这个1的后面的0是偶数个
    * n > 0 && (n & (n - 1) == 0) && (n & 0b10101010101010101010101010101010 == 0) // 0b10101010101010101010101010101010 == 0xaaaaaaaa
 */

class Solution_342 {
    
    /// 二进制表示中1的位置
    func isPowerOfFour(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1) == 0) && (n & 0xaaaaaaaa == 0)
    }
    
    /// 循环
    func isPowerOfFour_1(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        
        var n = n
        while n % 4 == 0 {
            n /= 4
        }

        return n == 1
    }
    
    func test() {
        print(isPowerOfFour(1))
        print(isPowerOfFour(2))
        print(isPowerOfFour(15))
        print(isPowerOfFour(255))
        
        print(isPowerOfFour(4))
        print(isPowerOfFour(16))
        print(isPowerOfFour(256))
    }
}
