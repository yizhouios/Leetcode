//
//  739.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/19.
//

import Foundation

/*
 739. 每日温度 (中等)
 https://leetcode-cn.com/problems/daily-temperatures/
 */

class Solution_739 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        // 参数校验
        if temperatures.isEmpty {
            return []
        }
        
        let count = temperatures.count
        var ans = [Int](repeating: 0, count: count)
        var stack = [Int]()
        
        for (idx, curTp) in temperatures.enumerated() {
            // 判断之前的温度，是否有比当前温度小的，如果有就移除栈，并更新其天数
            while !stack.isEmpty {
                let topIndex = stack.last!
                let preTp = temperatures[topIndex]
                if preTp >= curTp {
                    break
                }
                ans[topIndex] = idx - topIndex
                stack.removeLast()
            }
            
            stack.append(idx)
        }
        
        return ans
    }
}
