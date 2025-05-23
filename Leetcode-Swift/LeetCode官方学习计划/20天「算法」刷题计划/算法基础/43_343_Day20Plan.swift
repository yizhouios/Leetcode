//
//  43_343_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/9.
//

import Foundation

/*
 343. 整数拆分 (中等)
 https://leetcode-cn.com/problems/integer-break/
 */

class Solution_43_343_Day20Plan {
    func integerBreak(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 2...n {
            var maxVal = 0
            for j in 1..<i {
                maxVal = max(maxVal, j * (i - j), j * dp[i - j])
            }
            dp[i] = maxVal
        }
        return dp[n]
    }
    
    func test() {
        print(integerBreak(2))
        print(integerBreak(10))
    }
}
