//
//  349.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 349. 两个数组的交集 (简单)
 https://leetcode-cn.com/problems/intersection-of-two-arrays/
 */

class Solution_349 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.isEmpty || nums2.isEmpty {
            return []
        }

        var ans = [Int]()
        var map = [Int: Int]()

        for i in nums1 {
            map[i] = i
        }

        for j in nums2 {
            if let _ = map[j] { // 有交集
                // 加到答案中
                ans.append(j)
                // 删除，以达到去重的目的
                map.removeValue(forKey: j)
            }
        }

        return ans
    }
}
