//
//  Day3_121.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/24.
//

import Foundation

/*
 121. 买卖股票的最佳时机 (简单)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 */

class Solution_121_3weeksDataStructures {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        var ans = 0
        var minPrice = prices[0]
        for i in prices {
            minPrice = min(minPrice, i)
            ans = max(ans, i - minPrice)
        }
        
        return ans
    }

    func test() {
        print(maxProfit([7,1,5,3,6,4]))
        print(maxProfit([7,6,4,3,1]))
    }
}
