//
//  977_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/10.
//

import Foundation

/*
 977. 有序数组的平方 (简单)
 https://leetcode-cn.com/problems/squares-of-a-sorted-array/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/squares-of-a-sorted-array/solution/you-xu-shu-zu-de-ping-fang-by-leetcode-solution/
 */

class Solution_977_Day20Plan {
    /// 双指针
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let len = nums.count
        var ans = [Int](repeating: 0, count: len)
        
        var left = 0
        var right = len - 1
        // 由于存在负数，且负数的平方可能大于某些正数的平方。
        // 因此从两端往中间搜索元素的平方和，并将较大的平方和插入ans未填入的元素的末尾
        var index = right
        while left <= right {
            let leftVal = nums[left] * nums[left]
            let rightVal = nums[right] * nums[right]
            if leftVal >= rightVal {
                ans[index] = leftVal
                left += 1
            } else {
                ans[index] = rightVal
                right -= 1
            }
            index -= 1
        }
        
        return ans
    }
    
    func test() {
        print(sortedSquares([-4,-1,0,3,10]))
        print(sortedSquares([-7,-3,2,3,11]))
        
        print(sortedSquares([0,1,2,3]))
        print(sortedSquares([-5,-3,-2,-1]))
        print(sortedSquares([-5,-3,-2,0]))
    }
}
