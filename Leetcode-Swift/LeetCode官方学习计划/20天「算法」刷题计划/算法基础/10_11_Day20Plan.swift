//
//  10_11_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/25.
//

import Foundation

/*
 11. 盛最多水的容器 (中等)
 https://leetcode-cn.com/problems/container-with-most-water/
 */

class Solution_10_11_Day20Plan {
    func maxArea(_ height: [Int]) -> Int {
        var ans = 0
        var left = 0, right = height.count - 1
        while left < right {
            let heightL = height[left]
            let heightR = height[right]
            ans = max(ans, min(heightL, heightR) * (right - left))
            if heightL < heightR {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return ans
    }
    
    func test() {
        print(maxArea([1,8,6,2,5,4,8,3,7]))
        print(maxArea([1,1]))
    }
}
