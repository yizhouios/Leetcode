//
//  30_55_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/2.
//

import Foundation

/*
 55. 跳跃游戏 (中等)
 https://leetcode-cn.com/problems/jump-game/
 */

class Solution_30_55_Day20Plan {
    /// 贪心算法
    func canJump(_ nums: [Int]) -> Bool {
        let len = nums.count
        var rightmost = 0
        for i in 0..<len {
            if i <= rightmost {
                rightmost = max(rightmost, i + nums[i])
                if rightmost >= len - 1 {
                    return true
                }
            }
        }
        
        return false
    }
    
    func test() {
        print(canJump([2,3,1,1,4]))
        print(canJump([3,2,1,0,4]))
        print(canJump([0]))
        print(canJump([0,1]))
        
        print(canJump([1,2,3]))
    }
}
