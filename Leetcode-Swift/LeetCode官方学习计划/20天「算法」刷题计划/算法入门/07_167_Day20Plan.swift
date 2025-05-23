//
//  167_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/11.
//

import Foundation

/*
 167. 两数之和 II - 输入有序数组 (简单)
 https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/solution/liang-shu-zhi-he-ii-shu-ru-you-xu-shu-zu-by-leet-2/
 */

class Solution_167_Day20Plan {
    /// 使用双指针，left和right往中间进行查找
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if (sum > target) {
                right -= 1
            } else {
                left += 1
            }
        }
        return [-1, -1]
    }
    
    func test() {
        print(twoSum([2,7,11,15], 9))
        print(twoSum([2,3,4], 6))
        print(twoSum([-1,0], -1))
    }
}
