//
//  455.assign-cookies.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/14.
//

import Foundation

/*
 455. 分发饼干 (简单)
 https://leetcode-cn.com/problems/assign-cookies/
 */

class Solution455 {
    /*
     排序+贪心
     */
    
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var ans = 0
        let children = g.sorted()
        let candies = s.sorted()
        var j = 0
        for i in candies {
            guard j < children.count else {
                return ans
            }
            if i >= children[j] {
                ans += 1
                j += 1
            }
        }
        return ans
    }
    
    func findContentChildren1(_ g: [Int], _ s: [Int]) -> Int {
        var ans = 0
        let children = g.sorted()
        let candies = s.sorted()
        var j = 0
        for i in candies {
            if j < children.count {
                if i >= children[j] {
                    ans += 1
                    j += 1
                }
            } else {
                break
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 没有糖满足；有1个糖满足；多个糖满足；所有糖都满足
     2. 没有糖；没有孩子
     */
    func test() {
        print(findContentChildren([1,2,3], [1,1]))
        print(findContentChildren([1,2], [1,2,3]))
        
        // leetcode出错用例
        // 1. [10,9,8,7] [5,6,7,8]
        print(findContentChildren([10,9,8,7], [5,6,7,8]))
    }
}
