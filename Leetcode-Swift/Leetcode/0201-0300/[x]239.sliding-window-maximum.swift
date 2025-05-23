//
//  239.sliding-window-maximum.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/6.
//

import Foundation
/*
 239. 滑动窗口最大值 (困难)
 https://leetcode-cn.com/problems/sliding-window-maximum/
 */

class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 { return [] }
        
        var window = [Int](), res = [Int]()
        for (index, value) in nums.enumerated() {
            print(index, value)
        }
        return res
    }
    
    /*
     测试用例
     */
    func test() {
        maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
    }
}
