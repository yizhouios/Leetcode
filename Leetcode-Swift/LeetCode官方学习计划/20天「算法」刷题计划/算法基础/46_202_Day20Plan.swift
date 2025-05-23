//
//  46_202_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/10.
//

import Foundation

/*
 202. 快乐数 (简单)
 https://leetcode-cn.com/problems/happy-number/
 */

class Solution_46_202_Day20Plan {
    func isHappy(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        if n == 1 {
            return true
        }
        
        var n = n
        var existMap = [Int: Bool]()
        while existMap[n] == nil {
            if n == 1 {
                return true
            }
            
            existMap[n] = true
            
            var newN = 0
            while n > 0 {
                let theUnit = n % 10
                newN += theUnit * theUnit
                n /= 10
            }
            n = newN
        }
        
        return false
    }
    
    func test() {
        print(isHappy(19))
        print(isHappy(2))
    }
}
