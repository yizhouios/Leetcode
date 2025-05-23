//
//  188.best-time-to-buy-and-sell-stock-iv.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/21.
//

import Foundation

/*
 188. 买卖股票的最佳时机 IV (困难)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv/
 */

class Solution188 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.count == 0 || k <= 0 {
            return 0
        }
        let n = prices.count
        var buy: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n)
        var sell: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n)
        buy[0][0] = -prices[0]
        sell[0][0] = 0
        for i in 1...k {
            buy[0][i] = Int.min / 2
            sell[0][i] = Int.min / 2
        }
        for i in 1..<n {
            buy[i][0] = max(buy[i - 1][0], sell[i - 1][0] - prices[i])
            for j in 1...k {
                buy[i][j] = max(buy[i - 1][j], sell[i - 1][j] - prices[i])
                sell[i][j] = max(sell[i - 1][j], buy[i - 1][j - 1] + prices[i])
            }
        }
        
        return sell[n - 1].max()!
    }
    
    func test() {
        print(maxProfit(2, [2,4,1]))
        print(maxProfit(2, [3,2,6,5,0,3]))
    }
}
