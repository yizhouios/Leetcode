//
//  4.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2025/5/22.
//

import Foundation

public class Solution_4 {
    public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count1 = nums1.count
        let count2 = nums2.count
        let totalCount = count1 + count2

        // 是否是偶数个数
        let isEven = (count1 + count2) % 2 == 0
        let excludeCount = totalCount <= 2 ? 0 : (count1 + count2) / 2 - (isEven ? 1 : 0)

        var ans: Double = 0
        excludeNums(excludeCount, nums1, nums2, isEven, ans: &ans)

        return ans
    }

    func excludeNums(_ excludeCount: Int, _ nums1: [Int], _ nums2: [Int], _ isEven: Bool, ans: inout Double) {
        let count1 = nums1.count
        let count2 = nums2.count

        if count1 == 0 || count2 == 0 {
            let nums = count1 == 0 ? nums2 : nums1
            ans = isEven ? Double(nums[excludeCount] + nums[excludeCount + 1]) * 0.5 : Double(nums[excludeCount])
            return
        }
        
        // 处理这种情况 nums1: [1,3]、nums2: [2]
        if excludeCount == 1 {
            var nums1 = nums1
            var nums2 = nums2
            if nums1[0] > nums2[0] {
                nums2 = count2 > 1 ? Array(nums2[1...]) : []
            } else {
                nums1 = count1 > 1 ? Array(nums1[1...]) : []
            }
            ans = isEven ? Double(nums1[0] + nums2[0]) * 0.5 : Double(min(nums1[0], nums2[0]))
            return
        }

        if excludeCount == 0 {
            ans = isEven ? Double(nums1[0] + nums2[0]) * 0.5 : Double(min(nums1[0], nums2[0]))
            return
        }

        let maxIndexNums1 = nums1.count - 1
        let maxIndexNums2 = nums2.count - 1

        let index1 = excludeCount >= maxIndexNums1 ? maxIndexNums1 : excludeCount
        let index2 = excludeCount >= maxIndexNums2 ? maxIndexNums2 : excludeCount

        let num1 = nums1[index1]
        let num2 = nums2[index2]

        func excludeNums1() {
            // 排除nums1中index1前的数字
            let nexExcludeCount = (excludeCount >= count1) ? excludeCount - count1 : excludeCount - index1
            excludeNums(nexExcludeCount, (excludeCount >= count1) ? [] : Array(nums1[index1...]), nums2, isEven, ans: &ans)
        }
        
        func excludeNums2() {
            // 排除nums2中index2前的数字
            let nexExcludeCount = (excludeCount >= count2) ? excludeCount - count2 : excludeCount - index2
            excludeNums(nexExcludeCount, nums1, (excludeCount >= count2) ? [] : Array(nums2[index2...]), isEven, ans: &ans)
        }
        
        if num1 > num2 {
            excludeNums2()
        } else if num1 < num2 {
            excludeNums1()
        } else {
            if nums1[0] > nums2[0] {
                excludeNums2()
            } else {
                excludeNums1()
            }
        }
    }
    
    func test() {
        print(findMedianSortedArrays([1,3], [2]))
        print(findMedianSortedArrays([1,2], [3,4]))
        print(findMedianSortedArrays([1], [3]))
        print(findMedianSortedArrays([1,2], [4,5,6]))
        print(findMedianSortedArrays([1,2,3], [5,6]))
        print(findMedianSortedArrays([1,2,3], [4,5,6]))
        print(findMedianSortedArrays([0,0,0,0,0], [-1,0,0,0,0,0,1]))
    }
}
