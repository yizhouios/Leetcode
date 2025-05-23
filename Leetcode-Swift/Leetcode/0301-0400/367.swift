//
//  367.valid-perfect-square.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/17.
//

import Foundation

/*
 367. 有效的完全平方数 (简单)
 https://leetcode-cn.com/problems/valid-perfect-square/
 */

class Solution367 {
    func isPerfectSquare(_ num: Int) -> Bool {
        var low = 0
        var high = num / 2 + 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            let multiple = mid * mid

            if multiple == num {
                return true
            }

            if multiple > num {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return false
    }
    
    /*
     测试用例：
     1. 1；可被完全平方；不可被完全平方
     2. 0；小数
     */
    func test() {
        print(isPerfectSquare(1))
        print(isPerfectSquare(4))
        print(isPerfectSquare(9))
        print(isPerfectSquare(16))
        print(isPerfectSquare(2))
        print(isPerfectSquare(7))
        print(isPerfectSquare(15))
        print(isPerfectSquare(-4))
        print(isPerfectSquare(-5))
    }
}
