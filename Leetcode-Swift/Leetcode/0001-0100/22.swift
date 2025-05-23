//
//  22.generate-parentheses.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/16.
//

import Foundation

/*
 22. 括号生成 (中等)
 https://leetcode-cn.com/problems/generate-parentheses/
 */

/*
 思路：
 1. 暴力解法
 2. 回溯法
 */
class Solution_22 {
    func generateParenthesis(_ n: Int) -> [String] {
        if n <= 0 {
            return []
        }

        var path = [Character]()
        var ans = [String]()
        
        dfs(n, n, &path, &ans)

        return ans
    }

    func dfs(_ nLeft: Int, _ nRight: Int, _ path: inout [Character], _ res: inout [String]) {
        if (nLeft > nRight) || (nLeft < 0) || (nRight < 0) {
            return
        }

        if (nLeft == 0) && (nRight == 0) {
            res.append(String(path))
            return
        }

        path.append("(")
        dfs(nLeft - 1, nRight, &path, &res)
        path.removeLast()

        path.append(")")
        dfs(nLeft, nRight - 1, &path, &res)
        path.removeLast()
    }
    
    /*
     测试用例：
     1. 0；1；2；3等
     */
    func test() {
        generateParenthesis(0).print()
        generateParenthesis(1).print()
        generateParenthesis(2).print()
        generateParenthesis(3).print()
    }
}
