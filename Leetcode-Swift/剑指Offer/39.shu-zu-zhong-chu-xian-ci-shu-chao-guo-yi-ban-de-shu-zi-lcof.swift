//
//  39.shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/17.
//

import Foundation

/*
 剑指 Offer 39. 数组中出现次数超过一半的数字 (简单)
 https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
 */

class Solution_Offer_39 {
    
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var result = nums[0]
        var times = 1
        for i in nums[1...] {
            if times == 0 {
                result = i
                times = 1
            } else if i == result {
                times += 1
            } else {
                times -= 1
            }
        }
        
        times = 0
        for i in nums {
            if i == result {
                times += 1
            }
        }
        if times < (nums.count / 2) {
            return 0
        }
        
        return result
    }
    
    // 借助哈希表来记录每个数字出现的次数
    func majorityElement_1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var dict = [Int: Int]()
        for i in nums {
            dict[i, default: 0] += 1
        }
        let count = nums.count / 2
        for (key, value) in dict {
            if value > count {
                return key
            }
        }
        return 0
    }
    
    /*
     测试用例：
     1. 功能测试：存在/不存在超过数组一半的数
     2. 特殊输入测试：仅1个数字；空数组
     */
    func test() {
        print(majorityElement([1,1,1,2]))
        print(majorityElement([1,2,3,4,5]))
        print(majorityElement([1]))
        print(majorityElement([]))
    }
}
