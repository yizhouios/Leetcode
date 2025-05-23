//
//  04_746.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/21.
//

import Foundation

/*
 746. 使用最小花费爬楼梯 (简单)
 https://leetcode-cn.com/problems/min-cost-climbing-stairs/
 */

class Solution_746_dynamic_programming {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let count = cost.count
        if count < 3 {
            return cost.min() ?? 0
        }
        var dp = [Int](repeating: 0, count: count)
        for i in 2..<count {
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }
        return min(dp[count - 2] + cost[count - 2], dp[count - 1] + cost[count - 1])
    }
    
    func test() {
        print(minCostClimbingStairs([1,2]))
        print(minCostClimbingStairs([2,1]))
        print(minCostClimbingStairs([1,2,3]))
        print(minCostClimbingStairs([1,2,5,7,10,1,1]))
    }
}
