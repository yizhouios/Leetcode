//
//  16.21.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/3.
//

import Foundation

/*
 面试题 16.21. 交换和 (中等)
 https://leetcode-cn.com/problems/sum-swap-lcci/
 */

class Solution_Jindian1621 {
    func findSwapValues(_ array1: [Int], _ array2: [Int]) -> [Int] {
        // 计算array1的和
        var sum1 = 0
        for i in array1 {
            sum1 += i
        }
        
        // 计算array2的和
        var sum2 = 0
        for i in array2 {
            sum2 += i
        }
        
        // 如果sum1和sum2相等，不用交换
        if sum1 == sum2 {
            return []
        }

        let total = sum1 + sum2
        // 如果total是奇数直接返回，奇数不存在使得两个数相等的情况
        if total & 1 == 1 {
            return []
        }
        // 计算平均值
        let average = total / 2

        // 生成array2的哈希表
        var map = [Int: Int]()
        for i in array2 {
            map[i] = i
        }

        // 寻找交换元素，使得和为average
        for i in array1 {
            // sum1 - i + target = average
            let target = average - sum1 + i
            if let _ = map[target] {
                return [i, target]
            }
        }

        return []
    }
}
