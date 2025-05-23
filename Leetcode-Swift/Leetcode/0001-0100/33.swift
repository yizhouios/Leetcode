//
//  33.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/29.
//

import Foundation

/*
 33. 搜索旋转排序数组 (中等)
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
 */

class Solution_33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                return mid
            }

            if nums[0] > nums[mid] { // 代表mid在右侧递增区间
                if (target > nums[mid]) && (target <= nums[nums.count - 1]) { // 代表target在[mid+1, nums.count-1]区间
                    low = mid + 1
                } else { // 代表target在[low, mid-1]
                    high = mid - 1
                }
            } else { // 代表mid在左侧递增区间
                if ((target < nums[mid]) && target >= nums[0]) { // 代表target在[0, mid-1]区间
                    high = mid - 1
                } else { // 代表target在[mid+1, high]
                    low = mid + 1
                }
            }
        }

        return -1
    }
    
    func test() {
        assert(search([4,5,6,7,0,1,2], 0) == 4)
        assert(search([4,5,6,7,0,1,2], 3) == -1)
        assert(search([1], 0) == -1)
        print("success")
    }
}
