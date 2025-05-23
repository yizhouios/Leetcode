//
//  77_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/18.
//

import Foundation

/*
 77. 组合 (中等)
 https://leetcode-cn.com/problems/combinations/
 */

class Solution_77_Day20Plan {
    
    /// 递归优化
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var temp = [Int]()
        var ans = [[Int]]()
        
        func dfs(_ cur: Int, _ n: Int, _ k: Int) {
            // 剪枝
            if k > ((n - cur + 1) + temp.count) {
                return
            }
            if temp.count == k {
                ans.append(temp)
                return
            }
            // 有cur
            temp.append(cur)
            dfs(cur + 1, n, k)
            temp.removeLast()
            // 无cur
            dfs(cur + 1, n, k)
        }
        
        dfs(1, n, k)
        
        return ans
    }
    
    /// 递归
    func combine_1(_ n: Int, _ k: Int) -> [[Int]] {
        if k > n {
            return []
        }
        
        if n == k {
            return [Array(1...n)]
        }
        
        if k == 1 {
            var ans = [[Int]]()
            for i in 1...n {
                ans.append([i])
            }
            return ans
        }
        
        let sub1 = combine(n - 1, k)
        var sub2 = combine(n - 1, k - 1)
        if sub2.isEmpty {
            sub2 = [[n]]
        } else {
            sub2 = sub2.map({ val in
                var newVal = val
                newVal.append(n)
                return newVal
            })
        }
        
        return sub1.isEmpty ? sub2 : sub1 + sub2
    }
    
    func test() {
        print(combine(4, 2))
        print(combine(1, 1))
    }
}
