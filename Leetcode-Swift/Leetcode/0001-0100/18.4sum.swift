//
//  18.4sum.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/8.
//

import Foundation
/*
 18. 四数之和 (中等)
 https://leetcode-cn.com/problems/4sum/
 */

class Solution18 {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }

        let sorted = nums.sorted()
        let n = nums.count

        var res = [[Int]]()

        for i in 0..<(n - 3) {
            // 去重
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }

            // 当前值和最大的三个值之和
            if sorted[i] + sorted[n - 3] + sorted[n - 2] + sorted[n - 1] < target {
                continue
            }
            // 当前值和最小的三个值之和
            if sorted[i] + sorted[i + 1] + sorted[i + 2] + sorted[i + 3] > target {
                break
            }

            for j in (i + 1)..<(n - 2) {
                // 去重
                if j > i + 1 && sorted[j] == sorted[j - 1] {
                    continue
                }

                // 当前值和最大的两个值之和
                if sorted[i] + sorted[j] + sorted[n - 2] + sorted[n - 1] < target {
                    continue
                }
                // 当前值和最小的两个值之和
                if sorted[i] + sorted[j] + sorted[j + 1] + sorted[j + 2] > target {
                    break
                }

                var l = j + 1, r = n - 1
                while l < r {
                    let sum = sorted[i] + sorted[j] + sorted[l] + sorted[r]
                    if sum == target {
                        res.append([sorted[i], sorted[j], sorted[l], sorted[r]])
                        while l < r && sorted[l] == sorted[l + 1] { l += 1 }
                        while l < r && sorted[r] == sorted[r - 1] { r -= 1 }
                        l += 1
                        r -= 1
                    } else if sum > target {
                        r -= 1
                    } else {
                        l += 1
                    }
                }
            }
        }

        return res
    }
    /*
     思路：排序+双指针
     */
    func threeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let sortedNums = nums.sorted()
        var res: [[Int]] = []
        let count = nums.count
        for i in 0..<(count - 2) {
            if i != 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            let a = sortedNums[i]
            var left = i + 1
            var right = count - 1
            while left < right {
                let b = sortedNums[left]
                let c = sortedNums[right]
                if a + b + c == target {
                    res.append([a, b, c])
                    left += 1
                    while left < right && sortedNums[left] == sortedNums[left - 1] {
                        left += 1
                    }
                    right -= 1
                    while left < right && sortedNums[right] == sortedNums[right + 1] {
                        right -= 1
                    }
                } else {
                    if a + b + c > target {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        return res
    }
    
    func fourSum_self(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        let sortedNums = nums.sorted()
        var res: [[Int]] = []
        for i in 0..<(sortedNums.count - 3) {
            if i != 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            let others = threeSum(Array(sortedNums[(i+1)...]), target - sortedNums[i])
            if others.count > 0 {
                for other in others {
                    res.append([sortedNums[i]] + other)
                }
            }
        }
        return res
    }
    
    /*
     测试用例：
     1. 仅4个元素：不等于target（全部相等/不等）；等于target(全部相等/不等)
     2. 多个元素：不等于target；有多个等于
     4. 小于4个元素
     */
    func test() {
        print(fourSum([0,0,0,0], 6))
        print(fourSum([1,1,1,1], 8))
        print(fourSum([0,0,0,0], 0))
        print(fourSum([1,1,1,1], 4))
        print(fourSum([1,2,3,4], 10))
        
        print(fourSum([-1,2,3,5,1,0], 5))
        print(fourSum([-1,2,3,5,1,0], 10))
        
        print(fourSum([], 1))
        print(fourSum([1], 1))
        print(fourSum([1,2], 1))
        print(fourSum([1,2,3], 1))
    }
}
