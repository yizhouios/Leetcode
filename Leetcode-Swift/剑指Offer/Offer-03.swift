//
//  03.shu-zu-zhong-zhong-fu-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 03. 数组中重复的数字 (简单)
 https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
 */

/*
 思路：
 思路0. 利用哈希表存储出现过的数字，如果出现过，就返回该数
 思路1. 将遍历到的数字放到对应的索引处，如果发现已经有数字存在，那么返回该数（修改原数组）
 思路2. 同上，但是新建一个数组
 */
class Solution_Offer_03 {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        // 判断无效输入
        if nums.count == 0 {
            return -1
        }
        let count = nums.count
        if nums.filter({ (value) -> Bool in value < 0 || value >= count }).count > 0 {
            return -1
        }

        var array = Array(repeating: 0, count: nums.count)
        
        for n in nums {
            if array[n] == 1 {
                return n
            } else {
                array[n] = 1
            }
        }
        return -1
    }
    
    func findRepeatNumber_1(_ nums: [Int]) -> Int {
        // 判断无效输入
        if nums.count == 0 {
            return -1
        }
        let count = nums.count
        if nums.filter({ (value) -> Bool in value < 0 || value >= count }).count > 0 {
            return -1
        }
        
        var nums = nums
        
        for i in 0..<nums.count {
            while nums[i] != i {
                if nums[i] == nums[nums[i]] {
                    return nums[i]
                }
                nums.swapAt(i, nums[i])
            }
        }
        
        return -1
    }
    
    func findRepeatNumber_0(_ nums: [Int]) -> Int {
        var map = [Int: Int]()

        for i in nums {
            if let _ = map[i] {
                return i
            } else {
                map[i] = i
            }
        }

        return -1
    }
    
    
    /*
     测试用例：
     1. 重复数字仅1个；多个；无重复
     2. 数组元素空；数组中包含0~n-1之外的数字
     */
    func test() {
        let originalTests = """
        [1,1,2,3,4,5]
        [1,2,3,1,2,3]
        [1,2,3,4,10]
        []
        """
        let originalAnswers = """
        [1]
        [1,2,3]
        [-1]
        [-1
        """
        let tests = LeetCodeTestCaseTool.arrayWithMultilineText(originalTests)
        let anwsers = LeetCodeTestCaseTool.arrayWithMultilineText(originalAnswers)
        for (index, i) in tests.enumerated() {
            let ans = findRepeatNumber(i)
            assert(anwsers[index].contains(ans))
        }
    }
}
