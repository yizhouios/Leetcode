//
//  122.best-time-to-buy-and-sell-stock-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/13.
//

import Foundation
/*
 122. 买卖股票的最佳时机 II (简单)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
 */

/*
 思路：
 1. 贪心算法
 2. 动态规划
 */
class Solution122 {
    
    /// 动态规划
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var dp0 = 0, dp1 = -prices[0]
        for i in 1..<prices.count {
            dp0 = max(dp0, dp1 + prices[i])
            dp1 = max(dp1, dp0 - prices[i])
        }
        return dp0
    }
    
    /// 思路：贪心
    func maxProfit_greedy(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var ans = 0
        for i in 0..<prices.count {
            if i > 0 {
                if prices[i] > prices[i - 1] {
                    ans += prices[i] - prices[i - 1]
                }
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 有收益：2个元素；多个元素
     2. 无收益：1个元素；2个元素
     3. 空
     */
    func test() {
        print(maxProfit([1,3]))
        print(maxProfit([7,1,5,3,6,4]))
        print(maxProfit([1,2,3,4,9]))
        // --
        print(maxProfit([1]))
        print(maxProfit([2,1]))
        // --
        print(maxProfit([]))
        
        // leetcode错误用例
        // 1. [2,1,2,0,1]
        print(maxProfit([2,1,2,0,1]))
    }
}
