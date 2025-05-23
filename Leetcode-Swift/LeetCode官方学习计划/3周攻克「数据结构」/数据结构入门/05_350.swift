//
//  Day3_350.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/24.
//

import Foundation

/*
 350. 两个数组的交集 II (简单)
 https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/
 */

class Solution_350_3weeksDataStructures {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for val in nums1 {
            dict[val, default: 0] += 1
        }
        var ans = [Int]()
        for i in nums2 {
            if dict[i] != nil && dict[i]! > 0 {
                ans.append(i)
                dict[i]! -= 1
            }
        }
        return ans
    }
    
    func test() {
        print(intersect([1,2,2,1], [2,2]))
        print(intersect([4,9,5], [9,4,9,8,4]))
    }
}
