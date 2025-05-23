//
//  190_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/21.
//

import Foundation

/*
 190. 颠倒二进制位 (简单)
 https://leetcode-cn.com/problems/reverse-bits/
 */

class Solution_190_Day20Plan {
    
    
    // 初写
    func reverseBits(_ n: Int) -> Int {
        var ans = 0
        var n = n
        var rtl = 1
        var ltr = 1<<31
        
        while n != 0 {
            if n & rtl != 0 {
                ans |= ltr
            }
            n = n & ~rtl
            rtl <<= 1
            ltr >>= 1
        }
        
        return ans
    }
    
    func test() {
        print(reverseBits(0b00000010100101000001111010011100))
        print(reverseBits(0b11111111111111111111111111111101))
    }
}
