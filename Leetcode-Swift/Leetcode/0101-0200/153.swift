//
//  153.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/30.
//

import Foundation

/*
 153. 寻找旋转排序数组中的最小值 (中等)
 https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/
 */

class Solution_153 {
    func findMin(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }

        var low = 0
        var high = nums.count - 1
        var ans = nums[0]

        while low <= high {
            let mid = low + (high - low) / 2
            ans = min(ans, nums[mid])

            if nums[0] > nums[mid] { // 代表mid在右侧递增区间
                high = mid - 1
            } else { // 代表mid在左侧递增区间
                low = mid + 1
            }
        }

        return ans
    }
    
    func test() {
        print(findMin([1]))
        print(findMin([1,2,3]))
        print(findMin([3,2,1]))
        print(findMin([4,5,1,2,3]))
        print(findMin([4,5,6,1,2,3]))
        print(findMin([3,4,5,1,2]))
        print(findMin([4,5,6,7,0,1,2]))
        print(findMin([11,13,15,17]))
    }
}
