//
//  322.coin-change.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/21.
//

import Foundation

/*
 322. 零钱兑换 (中等)
 https://leetcode-cn.com/problems/coin-change/
 */

class Solution_322 {
    // MARK: - 完全背包问题 -> 最优问题（最少需要多少）
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if coins.isEmpty || amount < 0 {
            return -1
        }

        let count = coins.count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: amount + 1), count: count)

        for i in stride(from: 0, through: amount / coins[0], by: 1) {
            let amount = coins[0] * i
            dp[0][amount] = i
        }

        for i in 1..<count {
            let coin = coins[i]
            for j in 0...amount {
                let k = j / coin
                for c in 0...k {
                    let preJ = (j - c * coin)
                    if (preJ >= 0) && (dp[i - 1][preJ] != Int.max) {
                        dp[i][j] = min(dp[i][j], dp[i - 1][preJ] + c)
                    }
                }
                
            }
        }

        if dp[count - 1][amount] == Int.max {
            return -1
        }
        return dp[count - 1][amount]
    }
    
    // MARK: - 完全背包问题 -> 最优问题（最少需要多少）（优化）
    func coinChange_v2(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if coins.isEmpty || amount < 0 {
            return -1
        }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for coin in coins {
            for i in 1...amount {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    // MARK: - 爬楼梯思路
    func coinChange_v3(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if coins.isEmpty || amount < 0 {
            return -1
        }
        
        var dp = [Int](repeating: Int.max, count: amount + 1)
        dp[0] = 0

        for i in 1...amount {
            for coin in coins {
                if i >= coin && (dp[i - coin] != Int.max) {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        return dp[amount] != Int.max ? dp[amount] : -1
    }
}
