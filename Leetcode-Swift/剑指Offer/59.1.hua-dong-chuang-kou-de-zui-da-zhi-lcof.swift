//
//  59.1.hua-dong-chuang-kou-de-zui-da-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/31.
//

import Foundation

/*
 剑指 Offer 59 - I. 滑动窗口的最大值 (困难)
 https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof/
 */

class Solution_Offer_59_1 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 || k <= 0 || k > nums.count {
            return []
        }
        
        var dequeue = [Int]()
        var window = [Int]()
        var ans = [Int]()
        
        for (index, i) in nums.enumerated() {
            window.append(i)
            
            if dequeue.count == 0 {
                dequeue.append(index)
            } else {
                while dequeue.count > 0 && nums[dequeue.last!] <= i {
                    dequeue.removeLast()
                }
                dequeue.append(index)
            }
            
            if window.count == k {
                ans.append(nums[dequeue.first!])
                window.removeFirst()
                
                if dequeue.count > 0 && (index - dequeue.first! >= k - 1) {
                    dequeue.removeFirst()
                }
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：k为：1、数组的长度、(1-数组的长度）
     2. 特殊：空数组；k<=0；k>数组长度
     */
    func test() {
        let tests = [
//            ([1,3,-1,-3,5,3,6,7], 1),
//            ([1,3,-1,-3,5,3,6,7], 3),
//            ([1,3,-1,-3,5,3,6,7], 5),
//            ([1,3,-1,-3,5,3,6,7], 8),
//            ([], 3),
//            ([1,3,-1,-3,5,3,6,7], -1),
//            ([1,3,-1,-3,5,3,6,7], 20),
            
            // leetcode未过
            ([1,3,1,2,0,5], 3) // [3,3,2,5]
        ]
        
        for i in tests {
            print(maxSlidingWindow(i.0, i.1))
        }
    }
}
