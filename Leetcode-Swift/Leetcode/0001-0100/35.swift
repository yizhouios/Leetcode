//
//  35.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/28.
//

import Foundation

/*
 35. 搜索插入位置 (简单)
 https://leetcode-cn.com/problems/search-insert-position/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/search-insert-position/solution/sou-suo-cha-ru-wei-zhi-by-leetcode-solution/
 */

class Solution_35 {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = low + (high - low) / 2

            if nums[mid] >= target {
                if mid == 0 || (nums[mid - 1] < target) {
                    return mid
                } else {
                    high = mid - 1
                }
            } else {
                low = mid + 1
            }
        }

        return nums.count
    }
    
    func test() {
        print(searchInsert([1,3,5,6], 3))
        print(searchInsert([1,3,5,6], 0))
        print(searchInsert([1,3,5,6], 4))
        print(searchInsert([1,3,5,6], 7))
        print(searchInsert([1,3,5,6], 6))
    }
}
