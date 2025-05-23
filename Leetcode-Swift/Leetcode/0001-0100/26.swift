//
//  26.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/2.
//

import Foundation

/*
 26. 删除有序数组中的重复项 (简单)
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
 */

class Solution_26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var ans = 1
        for idx in 1..<nums.count {
            if nums[idx] == nums[idx - 1] {
                continue
            } else {
                nums[ans] = nums[idx]
                ans += 1
            }
        }
        
        return ans
    }
    
    func test() {
        var testArray = [1]
        assert(removeDuplicates(&testArray) == 1)
        testArray = [1,1,1,1]
        assert(removeDuplicates(&testArray) == 1)
        testArray = [1,2,3,4]
        assert(removeDuplicates(&testArray) == 4)
        testArray = [1,2,3,3]
        assert(removeDuplicates(&testArray) == 3)
        testArray = [1,1,2,3]
        assert(removeDuplicates(&testArray) == 3)
        testArray = [1,2,3,3]
        assert(removeDuplicates(&testArray) == 3)
        testArray = [1,2,2,3]
        assert(removeDuplicates(&testArray) == 3)
        
    }
}
