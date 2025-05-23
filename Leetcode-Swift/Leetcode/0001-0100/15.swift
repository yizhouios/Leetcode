//
//  15.3sum.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/7.
//

import Foundation

/*
 15. 三数之和 (中等)
 https://leetcode-cn.com/problems/3sum/
 */

class Solution_15 {
    // MARK: - 排序+双指针
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }

        let nums = nums.sorted()
        let count = nums.count
        var ans = [[Int]]()

        for a in 0..<(count - 2) {
            if (a > 0) && (nums[a] == nums[a - 1]) { // 避免a重复
                continue
            }
            var b = a + 1
            var c = count - 1

            while b < c {
                if (b > (a + 1)) && (nums[b] == nums[b - 1]) { // 避免b重复
                    b += 1
                    continue
                }
                if (c < (count - 1)) && (nums[c] == nums[c + 1]) { // 避免c重复
                    c -= 1
                    continue
                }

                let sum = nums[a] + nums[b] + nums[c]
                if sum == 0 {
                    ans.append([nums[a], nums[b], nums[c]])
                    b += 1
                    c -= 1
                } else if sum > 0 {
                    c -= 1
                } else {
                    b += 1
                }
            }
        }

        return ans
    }

    // MARK: - 排序+哈希表
    func threeSum_v2(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }

        let nums = nums.sorted()
        let n = nums.count
        var map = [Int: Int]()
        var ans = [[Int]]()

        // 生成值和索引对应的哈希表
        for (index, num) in nums.enumerated() {
            map[num] = index
        }

        for i in 0..<(n - 2) {
            if (i != 0) && (nums[i] == nums[i - 1]) { // 第一个元素去重
                continue
            }
            for j in (i + 1)..<(n - 1) {
                if (j > (i + 1)) && (nums[j] == nums[j - 1]) { // 第二个元素去重
                    continue
                }
                if let k = map[0 - nums[i] - nums[j]], k > j {
                    ans.append([nums[i], nums[j], nums[k]])
                }
            }
        }

        return ans
    }
}
