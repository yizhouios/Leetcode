//
//  50.powx-n.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/11.
//

import Foundation
/*
 50. Pow(x, n) (中等)
 https://leetcode-cn.com/problems/powx-n/
 */

class Solution50 {
    
    /*
     思路：迭代。
     例如：x^77 = (1001101)^77 = x^64 * x^8 * x^4 * x^1
     */
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var ans = 1.0
        var newX = x
        var power = abs(n)
        while power > 0 {
            if power & 1 == 1 {
                ans *= newX
            }
            newX *= newX
            power >>= 1
        }
        return n < 0 ? 1 / ans : ans
    }
    
    /*
     思路：递归。判断n的奇偶及正负
     */
    func myPow_recursive(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x
        }
        var value = 1.0
        value = n & 1 != 1 ? myPow_recursive(x, abs(n) / 2) : myPow_recursive(x, (abs(n) - 1) / 2)
        value *= value
        value = n & 1 != 1 ? value : value * x
        return n < 0 ? 1 / value : value
    }
    
    /*
     测试用例：
     1. x为正数、负数、0；n为正数、负数、0
     */
    func test() {
        // leetcode示例
        print(myPow(2.0, 10))
        print(myPow(2.1, 3))
        print(myPow(2.0, -2))
        
        print(myPow(10, 3))
        print(myPow(10, -3))
        print(myPow(10, 0))
        print(myPow(-10, 3))
        print(myPow(-10, -3))
        print(myPow(-10, 0))
        print(myPow(0, 3))
        print(myPow(0, -3))
        print(myPow(0, 0))
    }
}
