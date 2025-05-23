//
//  61.bu-ke-pai-zhong-de-shun-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/2.
//

import Foundation

/*
 剑指 Offer 61. 扑克牌中的顺子 (简单)
 https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/
 */

class Solution_Offer_61 {
    /// 优化版本
    func isStraight(_ nums: [Int]) -> Bool {
        if nums.isEmpty {
            return false
        }
        
        var dup = [Bool](repeating: false, count: 14)
        
        // 寻找最大值、最小值、以及0的个数
        var maxVal = -1
        var minVal = 14
        for i in nums {
            if i != 0 {
                // 去重判断
                if dup[i] {
                    return false
                }
                dup[i] = true
                
                maxVal = maxVal > i ? maxVal : i
                minVal = minVal < i ? minVal : i
            }
        }
        
        return (maxVal - minVal) < 5
    }
    
    /// 旧版本
    func isStraight_old(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return true
        }
        
        let count = nums.count
        let nums = nums.sorted(by: <)
        
        var zeroCount = 0
        var index = 0
        while index < count - 1 && nums[index] == 0 {
            zeroCount += 1
            index += 1
        }
        
        var numberOfGap = 0
        var next = index + 1
        while next < count {
            let pre = next - 1
            if nums[next] == nums[pre] {
                return false
            }
            
            numberOfGap += (nums[next] - nums[pre] - 1)
            next += 1
        }
        
        return numberOfGap > zeroCount ? false : true
    }
    
    /*
     测试用例：
     1. 功能：不含0的顺子和非顺子；含0的顺子和非顺子
     2. 特殊：空数组；
     */
    func test() {
        let tests = [
            [1,2,3,4,5],
            [1,10,2,3,4],
            [1,2,5,0,0],
            [1,2,5,0,10],
            []
        ]
        for i in tests {
            print(isStraight(i))
        }
    }
}
