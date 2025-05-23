//
//  45_384_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/10.
//

import Foundation

/*
 384. 打乱数组 (中等)
 https://leetcode-cn.com/problems/shuffle-an-array/
 */

class Solution_45_384_Day20Plan {
    var original: [Int]
    var random: [Int]
    let count: Int
    
    init(_ nums: [Int]) {
        self.original = nums
        self.random = nums
        self.count = nums.count
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        self.random = self.original
        return self.original
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        for i in 0..<count {
            self.random.swapAt(i, Int.random(in: i..<count))
        }
        return self.random
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
