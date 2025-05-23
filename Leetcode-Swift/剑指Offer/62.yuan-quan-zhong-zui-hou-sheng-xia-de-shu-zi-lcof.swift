//
//  62.yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/3.
//

import Foundation

/*
 剑指 Offer 62. 圆圈中最后剩下的数字 (简单)
 https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/
 */

class Solution_Offer_62 {
    
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        if n < 1 || m < 1 {
            return -1
        }
        
        var last = 0
        for i in 2...n {
            last = (last + m) % i
        }
        return last
    }
    
    func lastRemaining_self(_ n: Int, _ m: Int) -> Int {
        if n <= 0 {
            return -1
        }
        
        var ans = Array(0..<n)
        var index = 0
        var count = ans.count
        while count > 1 {
            index = (index + m - 1) % count
            ans.remove(at: index)
            count -= 1
        }
        
        return ans.first!
    }
    
    /*
     测试用例：
     1. 功能：m大于n；m小于n；m等于n
     2. 特殊输入：n为0
     3. 性能：如n=4000 m=997
     */
    func test() {
        let tests = [
            (5,6),
            (5, 3),
            (5,5),
            (0,1),
            (4000,997)
        ]
    
        for i in tests {
            print(lastRemaining(i.0, i.1))
        }
    }
}
