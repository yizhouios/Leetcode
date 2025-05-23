//
//  63.gu-piao-de-zui-da-li-run-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/3.
//

import Foundation

/*
 剑指 Offer 63. 股票的最大利润 (中等)
 https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/
 */

class Solution_Offer_63 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        
        var minPrice = prices[0]
        var maxProfit = 0
        for i in prices {
            maxProfit = max(maxProfit, i - minPrice)
            minPrice = min(i, minPrice)
        }
        
        return maxProfit
    }
    
    /*
     测试用例:
     1. 功能：递增、递减、无序
     2. 边界值：只有2个数字
     3. 特殊：空数组
     */
    func test() {
        let tests = [
            [7,1,5,3,6,4],
            [7,6,4,3,1],
            [1,2,3,4,5],
            [5,4,3,2,1],
            [1,5],
            [5,1],
            []
        ]
        
        for i in tests {
            print(maxProfit(i))
        }
    }
}
