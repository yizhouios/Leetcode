//
//  283_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/11.
//

import Foundation

/*
 283. 移动零 （简单）
 https://leetcode-cn.com/problems/move-zeroes/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/move-zeroes/solution/yi-dong-ling-by-leetcode-solution/
 */

class Solution_283_Day20Plan {
    /// 双指针：左指针的左侧为已经处理过且不包含0的序列（不包含left所指向的元素），right指针指向当前待处理的数字
    /// 如果right不为0，那么将这个数和left位置的元素交换，那么left位置就是被处理过了，因此右移left，指向下一个未处理或为0的数
    func moveZeroes(_ nums: inout [Int]) {
        let len = nums.count
        var left = 0
        for right in 0..<len {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
        }
    }
    
    func test() {
        var nums = [Int]()
        
        nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print(nums)

        nums = [1,2,3,0]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1,2,3]
        moveZeroes(&nums)
        print(nums)

        nums = [1,2,3]
        moveZeroes(&nums)
        print(nums)

        nums = [1,0,2,0,3]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1,0,2,0,3,0]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1]
        moveZeroes(&nums)
        print(nums)
        
        nums = [1,0,1]
        moveZeroes(&nums)
        print(nums)
    }
}
