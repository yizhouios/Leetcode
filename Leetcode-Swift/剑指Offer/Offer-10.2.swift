//
//  10.qing-wa-tiao-tai-jie-wen-ti-lcof-II.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/27.
//

import Foundation

/*
 剑指 Offer 10- II. 青蛙跳台阶问题 (简单)
 https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
 */

class Solution_Offer_10_2 {
    func numWays(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var f0 = 1
        var f1 = 1
        var ans = 0
        for _ in 2...n {
            ans = (f0 + f1) % 1000000007
            f0 = f1
            f1 = ans
        }
        
        return ans
    }
    
    func test() {
            print(numWays(3))
            print(numWays(5))
            print(numWays(10))
            
            print(numWays(0))
            print(numWays(1))
            print(numWays(2))
            
            print(numWays(40))
            print(numWays(41))
            print(numWays(100))
    }
}
