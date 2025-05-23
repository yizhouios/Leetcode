//
//  1425.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/1.
//

import Foundation

/*
 1425. 带限制的子序列和 (困难)
 https://leetcode-cn.com/problems/constrained-subsequence-sum/
 
 思路：
 1. https://leetcode-cn.com/problems/constrained-subsequence-sum/solution/dai-xian-zhi-de-zi-xu-lie-he-by-leetcode-k5dw/
 */

class Solution_1425 {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty || k <= 0 {
            return 0
        }
        
        let len = nums.count
        var dp = [Int](repeating: 0, count: len)
        dp[0] = nums[0]
        var deque = [0]
        
        var ans = dp[0]
        var index = 1
        while index < len {
            let val = nums[index]
            
            while !deque.isEmpty && (index - deque.first! > k) {
                deque.removeFirst()
            }
            
            let headSum = dp[deque.first!]
            let maxSum = (headSum > 0 ? headSum : 0) + val
            dp[index] = maxSum
            
            ans = ans > maxSum ? ans : maxSum
            
            while !deque.isEmpty && dp[deque.last!] <= maxSum {
                deque.removeLast()
            }
            deque.append(index)
            
            index += 1
        }
        
        return ans
    }
    
    func test() {
        print(constrainedSubsetSum([10,2,-10,5,20], 2))
        print(constrainedSubsetSum([-1,-2,-3], 1))
        print(constrainedSubsetSum([10,-2,-10,-5,20], 2))
        
        print(constrainedSubsetSum([-8269,3217,-4023,-4138,-683,6455,-3621,9242,4015,-3790], 1)) // 16091
    }
}
