//
//  1.tow-sum.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2021/4/3.
//

import Foundation

/*
 1.两数之和（简单）
 https://leetcode-cn.com/problems/two-sum
 */

class Solution_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for index in 0..<nums.count {
            let a = nums[index]
            let b = target - a
            let index_b = dict[b]
            if index_b != nil {
                return [index, index_b!]
            }

            dict[a] = index
        }

        return []
    }
}
