//
//  60.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/2.
//

import Foundation

/*
 60. 排列序列 (困难)
 https://leetcode-cn.com/problems/permutation-sequence/
 
 思路：
 1. https://leetcode-cn.com/problems/permutation-sequence/solution/hui-su-jian-zhi-python-dai-ma-java-dai-ma-by-liwei/
 */

class Solution_60 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        if n <= 0 || k <= 0 {
            return ""
        }
        
        var used = [Bool](repeating: false, count: n)
        var ans = ""
        var factorial = [Int](repeating: 1, count: n + 1)
        for i in 2..<(n + 1) {
            factorial[i] = factorial[i - 1] * i
        }
        
        func dfs(_ allLevel: Int, _ k: Int, _ curLevel: Int) {
            if curLevel == allLevel {
                return
            }
            
            let cnt = factorial[allLevel - curLevel - 1]
            var newK = k
            for i in 0..<allLevel {
                if used[i] {
                    continue
                }
                if cnt < newK {
                    newK -= cnt
                    continue
                }
                used[i] = true
                ans.append("\(i + 1)")
                dfs(allLevel, newK, curLevel + 1)
                break
            }
        }
        
        dfs(n, k, 0)
        return ans
    }
    
    func test() {
        print(getPermutation(3, 3))
        print(getPermutation(4, 9))
        print(getPermutation(3, 1))
        
        print(getPermutation(1, 1))
        
        print(getPermutation(2, 1))
        print(getPermutation(2, 2))
    }
}
