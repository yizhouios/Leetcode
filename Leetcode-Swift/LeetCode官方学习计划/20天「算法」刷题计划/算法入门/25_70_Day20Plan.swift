//
//  70_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/19.
//

import Foundation

/*
 70. 爬楼梯 (简单)
 https://leetcode-cn.com/problems/climbing-stairs/
 */

class Solution_70_Day20Plan {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        
        var f1 = 1
        var f2 = 2
        for _ in 3...n {
            let next = f1 + f2
            f1 = f2
            f2 = next
        }
        
        return f2
    }
    
    func test() {
        print(climbStairs(2))
        print(climbStairs(3))
        print(climbStairs(4))
    }
}
