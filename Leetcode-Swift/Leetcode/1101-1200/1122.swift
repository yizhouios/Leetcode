//
//  1122.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 1122. 数组的相对排序 (简单)
 https://leetcode-cn.com/problems/relative-sort-array/
 */

class Solution_1122 {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        if arr1.isEmpty {
            return []
        }

        if arr2.isEmpty {
            return arr1.sorted()
        }

        var map = [Int: Int]()
        var k = 0
        var ans = [Int](repeating: 0, count: arr1.count)

        // 统计arr2中出现的数字
        for i in arr2 {
            map[i] = 0
        }

        // 统计arr2中的数字在arr1中的个数
        for i in arr1 {
            if let count = map[i] {
                map[i] = count + 1
            }
        }

        // 将arr2中的顺序及个数，放到结果数组中
        for key in arr2 {
            let count = map[key]!
            for _ in 0..<count {
                ans[k] = key
                k += 1
            }
        }

        // 未在arr2中的数字，按升序放入结果数组中
        let sortedArr1 = arr1.sorted()
        for i in sortedArr1 {
            if let _ = map[i] {
                continue
            }
            ans[k] = i
            k += 1
        }

        return ans
    }
}
