//
//  90.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/2.
//

import Foundation

/*
 90. 子集 II (中等)
 https://leetcode-cn.com/problems/subsets-ii/
 */

class Solution_90 {
    /// 法一：结合78题，只需添加去重的判断即可
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ans = [[Int]]()
        ans.append([])

        for i in 1...nums.count {
            let paths = combine(nums, i)
            if !paths.isEmpty {
                ans.append(contentsOf: paths)
            }
        }
        
        return ans
    }

    func combine(_ nums: [Int], _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()

        combineCore(nums, 0, k, &path, &res)

        return res
    }

    func combineCore(_ nums: [Int], _ begin: Int, _ k: Int, _ path: inout [Int], _ res: inout [[Int]]) {
        if k <= 0 {
            res.append(path)
            return
        }

        if begin >= nums.count {
            return
        }

        for i in begin..<nums.count {
            if i > begin && (nums[i] == nums[i - 1]) {
                continue
            }

            path.append(nums[i])
            combineCore(nums, i + 1, k - 1, &path, &res)
            path.removeLast()
        }
    }
    
    /// 法二
    func subsetsWithDup_2(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
        let nums = nums.sorted()
        let len = nums.count
        var ans = [[Int]]()
        var path = [Int]()
        
        func dfs(_ choosePre: Bool, _ startIndex: Int) {
            if startIndex == len {
                ans.append(path)
                return
            }
            
            // 不选择自己
            dfs(false, startIndex + 1)
            
            // 选择自己（如果上一个没选，且上一个的值和当前值一样，那么当前这个值要过滤掉）
            if !choosePre && startIndex > 0 && nums[startIndex] == nums[startIndex - 1] {
                return
            }
            
            path.append(nums[startIndex])
            dfs(true, startIndex + 1)
            path.removeLast()
        }
        
        dfs(false, 0)
        
        return ans
    }
}
