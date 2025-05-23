//
//  213_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/20.
//

import Foundation

/*
 231. 2 的幂 (简单)
 https://leetcode-cn.com/problems/power-of-two/
 */

class Solution_213_Day20Plan {
    func isPowerOfTwo(_ n: Int) -> Bool {
        // 递归
        // if n == 1 {return true}
        // if n < 1 || n % 2 != 0 {return false}
        // return isPowerOfTwo(n/2)

        // 循环
        // var n = n
        // while n % 2 == 0 && n > 0 {
        //     n /= 2
        // }
        // return n == 1
        
        return (n > 0) && (n & (n - 1) == 0)
    }
    
    func test() {
        print(isPowerOfTwo(-4))
        print(isPowerOfTwo(-2))
        print(isPowerOfTwo(0))
        print(isPowerOfTwo(1))
        print(isPowerOfTwo(2))
        print(isPowerOfTwo(3))
        print(isPowerOfTwo(4))
        print(isPowerOfTwo(16))
    }
}
