//
//  Day2_01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/23.
//

import Foundation

/*
 1. 两数之和 (简单)
 https://leetcode-cn.com/problems/two-sum/
 */

class Solution_01_3weeksDataStructures {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, val) in nums.enumerated() {
            if dict[target - val] != nil {
                return [dict[target - val]!, index]
            } else {
                dict[val] = index
            }
        }
        
        return []
    }
    
    func test() {
        print(twoSum([2,7,11,15], 9))
        print(twoSum([3, 2, 4], 6))
    }
}
