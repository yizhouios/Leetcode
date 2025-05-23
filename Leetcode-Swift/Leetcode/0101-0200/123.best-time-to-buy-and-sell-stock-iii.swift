//
//  123.best-time-to-buy-and-sell-stock-iii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/20.
//

import Foundation

/*
 123. 买卖股票的最佳时机 III (困难)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iii/
 */

class Solution123 {
    /// 动态规划
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var buy1 = -prices[0], sell1 = 0
        var buy2 = -prices[0], sell2 = 0
        for i in 1..<prices.count {
            buy1 = max(buy1, -prices[i])
            sell1 = max(sell1, buy1 + prices[i])
            buy2 = max(buy2, sell1 - prices[i])
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }
    
    func test() {
        print(maxProfit([3,3,5,0,0,3,1,4]))
        print(maxProfit([1,2,3,4,5]))
        print(maxProfit([7,6,4,3,1]))
        print(maxProfit([1]))
    }
}
