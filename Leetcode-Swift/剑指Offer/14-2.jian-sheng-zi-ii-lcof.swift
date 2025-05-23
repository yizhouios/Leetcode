//
//  14-2.jian-sheng-zi-ii-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/29.
//

import Foundation

/*
 剑指 Offer 14- II. 剪绳子 II (中等)
 https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/
 */

/*
 思路：
 1. 贪心
 2. 递归
 */
class Solution_Offer_14_2 {
    
    /*
     贪心：O(n)
     */
    func cuttingRope(_ n: Int) -> Int {
        if n < 4 {
            return n - 1
        }
        var res = 1
        var n = n
        while n > 4 {
            res = res * 3 % 1000000007
            n -= 3
        }
        return res * n % 1000000007
    }
    
    func cuttingRope_dp(_ n: Int) -> Int {
        // n小于4直接返回 n - 1
        if n < 4 {
            return n - 1
        }
        // n等于4 2x2 > 3x1
        if n == 4 {
            return 4
        }
        var dp = [Int](repeating: 0, count: n + 1)
        // dp[i]代表应该乘以的最长长度
        dp[0] = 0 // 剩余长度为0，应该乘0
        dp[1] = 1 // 剩余长度为1，应该乘1
        dp[2] = 2 // 剩余长度为2，应该乘2
        dp[3] = 3 // 剩余长度为3，应该乘3
        dp[4] = 4 // 剩余长度为4，应该乘4
        for i in 5...n {
            dp[i] = 3 * dp[i - 3] % 1000000007
        }
        return dp[n]
    }
    
    /*
     测试用例：
     1. 功能测试：长度大于5
     2. 边界值测试：0、1、2、3、4
     */
    func test() {
        print(cuttingRope_dp(999))
        print(cuttingRope(999))
    }
}
