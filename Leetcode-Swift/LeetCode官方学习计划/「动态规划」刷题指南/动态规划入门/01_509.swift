//
//  01_509.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/20.
//

import Foundation

/*
 509. 斐波那契数 (简单)
 https://leetcode-cn.com/problems/fibonacci-number/
 */

class Solution_509_dynamic_programming {
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var f1 = 0
        var f2 = 1
        for _ in 2...n {
            let tmp = f1 + f2
            f1 = f2
            f2 = tmp
        }
        return f2
    }
}
