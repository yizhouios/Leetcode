//
//  21_78_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/30.
//

import Foundation

/*
 78. 子集 (中等)
 https://leetcode-cn.com/problems/subsets/
 */

class Solution_21_78_Day20Plan {
    // 回溯
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var path = [Int]()
        
        func backtrack(_ nums: [Int], _ startIndex: Int) {
            ans.append(path)
            
            for i in startIndex..<nums.count {
                path.append(nums[i])
                backtrack(nums, i + 1)
                path.removeLast()
            }
        }
        backtrack(nums, 0)
        return ans
    }
    
    func test() {
        print(subsets([1,2,3]))
    }
}
