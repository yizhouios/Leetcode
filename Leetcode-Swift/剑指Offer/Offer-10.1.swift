//
//  10.fei-bo-na-qi-shu-lie-lcof-I.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/26.
//

import Foundation
/*
 剑指 Offer 10- I. 斐波那契数列 (简单)
 https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/
 */

class Solution_Offer_10_1 {
    
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var f0 = 0
        var f1 = 1
        var ans = 0
        for _ in 2...n {
            ans = (f0 + f1) % 1000000007 // https://xie.infoq.cn/article/b07c8af0a2924b4eafdfba2a2
            f0 = f1
            f1 = ans
        }
        
        return ans
    }
    
    func fib_recursive(_ n: Int) -> Int {
        return n <= 1 ? n : fib(n - 1) + fib(n - 2)
    }
    
    /*
     测试用例：
     1. 功能测试：3、5、10等
     2. 边界值测试：0、1、2
     3. 性能测试：40、50、100等
     */
    func test() {
        print(fib(3))
        print(fib(5))
        print(fib(10))
        
        print(fib(0))
        print(fib(1))
        print(fib(2))
        
        print(fib(40))
        print(fib(41))
        print(fib(100))
    }
}
