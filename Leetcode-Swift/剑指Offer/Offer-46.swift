//
//  46.ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/21.
//

import Foundation

/*
 剑指 Offer 46. 把数字翻译成字符串 (中等)
 https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/
 */

class Solution_Offer_46 {
    // MARK: - 动态规划（爬楼梯思路）
    func translateNum(_ num: Int) -> Int {
        let digits = getDigits(num)
        let count = digits.count

        if count <= 0 { return 0 }
        if count == 1 { return 1 }
        
        var dp = [Int](repeating: 1, count: count + 1)

        for i in 2...count {
            dp[i] = dp[i - 1]
            if isValid(digits[i - 2], digits[i - 1]) {
                dp[i] += dp[i - 2]
            }
        }

        return dp[count]
    }

    // MARK: - 动态规划（利用元组）
    func translateNum_v2(_ num: Int) -> Int {
        let digits = getDigits(num)
        let count = digits.count

        if count <= 0 { return 0 }
        if count == 1 { return 1 }

        // 元组表示：(与前一个数组合，不与前一个数组合)
        var dp = Array<(Int, Int)>.init(repeating: (0, 0), count: count + 1)
        dp[1] = (0, 1)

        for i in 2...count {
            if isValid(digits[i - 2], digits[i - 1]) {
                dp[i] = (0, dp[i - 1].0 + dp[i - 1].1)
            } else {
                dp[i] = (dp[i - 1].1, dp[i - 1].0 + dp[i - 1].1)
            }
        }

        return dp.last!.0 + dp.last!.1
    }

    // MARK: -
    func isValid(_ numA: Int, _ numB: Int) -> Bool {
        if numA == 0 { return false }
        if numA * 10 + numB > 25 { return false }
        return true
    }

    func getDigits(_ num: Int) -> [Int] {
        if num < 0 {
            return []
        }
        if num == 0 {
            return [0]
        }

        var num = num
        var nums = [Int]()
        while num > 0 {
            nums.insert(num % 10, at: 0)
            num /= 10
        }

        return nums
    }
}
