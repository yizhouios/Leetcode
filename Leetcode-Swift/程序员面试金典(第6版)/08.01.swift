//
//  08.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/24.
//

import Foundation

/*
 面试题 08.01. 三步问题 (简单)
 https://leetcode-cn.com/problems/three-steps-problem-lcci/
 */

class Solution_Jindian_0801 {
    func waysToStep(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        if n == 2 {
            return 2
        }
        if n == 3 {
            return 4
        }
        
        var f1 = 1
        var f2 = 2
        var f3 = 4
        for i in 4...n {
            var tmp = (f1 + f2 + f3) % 1000000007
            f1 = f2
            f2 = f3
            f3 = tmp
        }

        return f3
    }
}

