//
//  169.majority-element.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/11.
//

import Foundation
/*
 169. 多数元素 (简单)
 https://leetcode-cn.com/problems/majority-element/
 */

/*
 所有思路：
 1. 暴力：两重循环
 2. map
 3. sort
 4. 分治
 */
class Solution169 {
    
    /// 思路：分治
    func majorityElement(_ nums: [Int]) -> Int {
        func inner(_ low: Int, _ high: Int) -> Int {
            if low == high {
                return nums[low]
            }
            let mid = low + (high - low) / 2
            let left = inner(low, mid)
            let right = inner(mid + 1, high)
            
            if left == right {
                return left
            }
            
            let left_count = nums[low...high].reduce(0) { (a, b) -> Int in
                if b == left {
                    return a + 1
                }
                return a
            }
            let right_count = nums[low...high].reduce(0) { (a, b) -> Int in
                if b == right {
                    return a + 1
                }
                return a
            }
            return left_count > right_count ? left : right
        }
        
        return inner(0, nums.count - 1)
    }
    
    /// 思路：map
    func majorityElement_map(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for i in nums {
            dict[i, default: 0] += 1
        }
        let count = nums.count / 2
        for (key, value) in dict {
            if value > count {
                return key
            }
        }
        return -1
    }
    
    /// 思路：排序
    func majorityElement_sort(_ nums: [Int]) -> Int {
        return nums.sorted()[nums.count / 2]
    }
    
    /*
     测试用例：
     1. 1个元素、两个相等元素、三个元素
     */
    func test() {
        print(majorityElement([1]))
        print(majorityElement([1,1]))
        print(majorityElement([1,2,2]))
        print(majorityElement([1,2,3,6,6,6,6,6]))
        
        print(majorityElement([1,1,1,1,1,1,8]))
    }
}
