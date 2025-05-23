//
//  704.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/28.
//

import Foundation

/*
 704. 二分查找 (简单)
 https://leetcode-cn.com/problems/binary-search/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/binary-search/solution/er-fen-cha-zhao-by-leetcode-solution-f0xw/
 */

class Solution_704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 定义区间
        var low = 0
        var high = nums.count - 1

        // 依次减小区间寻找target
        while low <= high {
            let mid = low + (high - low) / 2

            if nums[mid] == target {
                return mid
            } else if (nums[mid] > target) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return -1
    }
    
    func test() {
        assert(search([-1,0,3,5,9,12], -1) == 0)
        assert(search([-1,0,3,5,9,12], 3) == 2)
        assert(search([-1,0,3,5,9,12], 5) == 3)
        assert(search([-1,0,3,5,9,12], 9) == 4)
        assert(search([-1,0,3,5,9,12], 12) == 5)
        assert(search([-1,0,3,5,9,12], 15) == -1)
        assert(search([-1,0,3,4,5,9,12], -1) == 0)
        assert(search([-1,0,3,4,5,9,12], 4) == 3)
        assert(search([-1,0,3,4,5,9,12], 3) == 2)
        assert(search([-1,0,3,4,5,9,12], 5) == 4)
        assert(search([-1,0,3,4,5,9,12], 9) == 5)
        assert(search([-1,0,3,4,5,9,12], 12) == 6)
        assert(search([-1,0,3,4,5,9,12], 15) == -1)
        print("success")
    }
}
