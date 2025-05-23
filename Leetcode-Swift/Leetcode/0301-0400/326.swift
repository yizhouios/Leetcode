//
//  326.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/5.
//

import Foundation

/*
 326. 3的幂 (简单)
 https://leetcode-cn.com/problems/power-of-three/
 */

class Solution_326 {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        
        var n = n
        while n % 3 == 0 {
            n /= 3
        }

        return n == 1
    }
    
    func test() {
        print(isPowerOfThree(1))
        print(isPowerOfThree(9))
        print(isPowerOfThree(10))
        print(isPowerOfThree(27))
        print(isPowerOfThree(81))
    }
}
