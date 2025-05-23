//
//  42_322_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/8.
//

import Foundation

/*
 322. 零钱兑换 (中等)
 https://leetcode-cn.com/problems/coin-change/
 */

class Solution_42_322_Day20Plan {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if amount <= 0 {
            return -1
        }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    func test() {
        print(coinChange([1,2,5], 11))
    }
}
