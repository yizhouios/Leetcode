//
//  31_45_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/3.
//

import Foundation

/*
 45. 跳跃游戏 II (中等)
 https://leetcode-cn.com/problems/jump-game-ii/
 */

class Solution_31_45_Day20Plan {
    func jump(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        
        let len = nums.count
        var steps = [Int](repeating: 0, count: len)
        
        for i in 0..<(len - 1) {
            if nums[i] == 0 {
                continue
            }
            var step = nums[i]
            while step > 0 {
                if i + step >= (len - 1) {
                    return steps[i] + 1
                } else {
                    if steps[i + step] == 0 {
                        steps[i + step] = steps[i] + 1
                    }
                }
                step -= 1
            }
        }
        return -1
    }
    
    func test() {
        print(jump([2,3,1,1,4]))
        print(jump([2,3,0,1,4]))
        print(jump([1,1]))
        print(jump([0,4]))
    }
}
