//
//  136.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 136. 只出现一次的数字 (简单)
 https://leetcode-cn.com/problems/single-number/
 
 解法：
 1. 哈希表
 2. 位图
 3. 排序
 4. 位运算
 */

class Solution_136 {
    
    // 哈希表
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()

        for i in nums {
            map[i, default: 0] += 1
        }

        for (key, value) in map {
            if value == 1 {
                return key
            }
        }

        return -1
    }
    
    // 位运算
    func singleNumber_4(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var ans = nums[0]
        for i in 1..<nums.count {
            ans ^= nums[i]
        }
        return ans
    }
    
    func test() {
        print(singleNumber([2,2,1]))
        print(singleNumber([4,1,2,1,2]))
    }
}
