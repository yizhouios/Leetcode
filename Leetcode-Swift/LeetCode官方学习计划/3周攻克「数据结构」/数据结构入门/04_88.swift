//
//  Day2_88.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/23.
//

import Foundation

/*
 88. 合并两个有序数组 (简单)
 https://leetcode-cn.com/problems/merge-sorted-array/
 */

class Solution_88_3weeksDataStructures {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m - 1
        var index2 = n - 1
        var end = m + n - 1
        while index1 >= 0 && index2 >= 0 {
            if nums1[index1] >= nums2[index2] {
                nums1[end] = nums1[index1]
                index1 -= 1
            } else {
                nums1[end] = nums2[index2]
                index2 -= 1
            }
            end -= 1
        }
        while index1 >= 0 {
            nums1[end] = nums1[index1]
            end -= 1
            index1 -= 1
        }
        while index2 >= 0 {
            nums1[end] = nums2[index2]
            end -= 1
            index2 -= 1
        }
    }
    
    func test() {
        var nums = [1,2,3,0,0,0]
        merge(&nums, 3, [2,5,6], 3)
        print(nums)
        
        nums = [1]
        merge(&nums, 1, [], 0)
        print(nums)
    }
}
