//
//  486.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/7.
//

import Foundation

/*
 486. 预测赢家 (中等)
 https://leetcode-cn.com/problems/predict-the-winner/
 */

class Solution_486 {
    
    /// 使用动态规划
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        let len = nums.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: len), count: len)
        for (index, val) in nums.enumerated() {
            dp[index][index] = val
        }
        
        for j in 1..<len {
            for i in stride(from: j - 1, to: -1, by: -1) {
                let pickLeft = nums[i] - dp[i + 1][j]
                let pickRight = nums[j] - dp[i][j - 1]
                dp[i][j] = pickLeft > pickRight ? pickLeft : pickRight
            }
        }
        
        return dp[0][len - 1] >= 0
    }
    
    // 记忆化递归
    func PredictTheWinner_1(_ nums: [Int]) -> Bool {
        let len = nums.count
        var memorys = [[Int?]](repeatElement([Int?](repeating: nil, count: len), count: len))
        
        func netScores(_ left: Int, _ right: Int) -> Int {
            if left == right {
                return nums[left]
            }
            
            if let val = memorys[left][right] {
                return val
            }
            
            let pickLeft = nums[left] - netScores(left + 1, right)
            let pickRight = nums[right] - netScores(left, right - 1)
            let res = pickLeft > pickRight ? pickLeft : pickRight;
            
            if memorys[left][right] == nil {
                memorys[left][right] = res
            }
            
            return res
        }

        return netScores(0, nums.count - 1) >= 0
    }
    
    func test() {
        print(PredictTheWinner([1]))
        print(PredictTheWinner([1, 5, 2]))
        print(PredictTheWinner([1, 5, 233, 7]))
    }
}
