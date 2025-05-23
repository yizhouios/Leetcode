//
//  Day1_217.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/22.
//

import Foundation

/*
 217. 存在重复元素 (简单)
 https://leetcode-cn.com/problems/contains-duplicate/
 */

class Solution_217_3weeksDataStructures {
    /// 法二：排序
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let nums = nums.sorted()
        for i in 0..<(nums.count - 1) {
            if nums[i] == nums[i + 1] {
                return true
            }
        }
        
        return false
    }
    
    /// 法一：利用集合
    func containsDuplicate_1(_ nums: [Int]) -> Bool {
        var numSet = Set<Int>()
        for i in nums {
//            if numSet.contains(i) {
//                return true
//            }
//            numSet.insert(i)
            // 或
            let res = numSet.insert(i)
            if !res.inserted {
                return true
            }
        }
        return false
    }
    
    func test() {
        assert(containsDuplicate([1,2,3,1]) == true)
        assert(containsDuplicate([1,2,3]) == false)
    }
}
