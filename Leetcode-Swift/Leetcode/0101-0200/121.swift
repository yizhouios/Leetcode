//
//  121.best-time-to-buy-and-sell-stock.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/14.
//

import Foundation
/*
 121. 买卖股票的最佳时机 (简单)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 */

class Solution_121 {
    // MARK: 一次遍历
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }

        var ans = 0
        var minPrice = prices[0]

        for i in prices {
            ans = max(ans, i - minPrice)
            minPrice = min(minPrice, i)
        }

        return ans
    }
}
