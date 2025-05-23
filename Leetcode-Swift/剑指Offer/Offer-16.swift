//
//  16.shu-zhi-de-zheng-shu-ci-fang-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/1.
//

import Foundation

/*
 剑指 Offer 16. 数值的整数次方 (中等)
 https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof/
 */

/*
 方法：
 法一：迭代
 法二：递归
 */
class Solution_Offer_16 {
    
    /*
     迭代解法，关键点在①处。
     例如：求myPow(x, 77)。77二进制表示为：0b01001101
     那么执行过程就是：
     初始化 ans = 1；new = x
     之后开始4次迭代（1从右开始数）：
        1. ans * newX (第1位1, newX = x^2^0)
        2. ans * newX (第3位1, newX = x^2^2)
        3. ans * newX (第4位1, newX = x^2^3)
        4. ans * newX (第7位1, newX = x^2^6)
     结果 ans = x^1 + x^4 + x^8 + x^64 = ans * x^(1+4+8+64) = ans*x^77
     */
    func myPow_iretation(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var ans: Double = 1
        var power = abs(n)
        var newX = x
        while power > 0 {
            if power & 1 == 1 {
                ans *= newX // ①此句数关键：当左右侧二进制位为1是我们将当前的newX乘进ans
            }
            newX *= newX
            power = power >> 1
        }

        return n < 0 ? 1 / ans : ans
    }
    
    /// 递归解法
    func myPow(_ x: Double, _ n: Int) -> Double {
        // 递归终止条件①
        if n == 0 {
            return 1
        }
        // 递归终止条件②
        if n == 1 {
            return x
        }
        var ans = myPow(x, abs(n) >> 1) // abs(n)存在溢出的情况: x=2.00000 n=-2147483638
        ans *= ans
        ans = n & 1 == 1 ? ans * x : ans
        return n < 0 ? 1 / ans : ans
    }
    
    /*
     测试用例：
     1. 功能测试：x为正数、负数；n为正数、负数
     2. 边界值测试：x为0、n为0
     3. 特殊输入测试：底数为0，指数为负数，理论上应该以某种方式报错
     */
    func test() {
        print(myPow(2, 4))
        print(myPow(-2, 4))
        print(myPow(3, 10))
        print(myPow(3, -10))
        print(myPow(-3, -10))
        print(myPow(0, 10))
        print(myPow(10, 0))
    }
}
