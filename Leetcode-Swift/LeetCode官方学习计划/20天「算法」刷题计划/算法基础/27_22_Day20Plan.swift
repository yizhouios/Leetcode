//
//  27_22_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/1.
//

import Foundation

/*
 22. 括号生成 (中等)
 https://leetcode-cn.com/problems/generate-parentheses/
 */

class Solution_27_22_Day20Plan {
    func generateParenthesis(_ n: Int) -> [String] {
        if n <= 0 {
           return []
        }
        var ans = [String]()
        var cur = ""
        func backtrack(_ open: Int, _ close: Int, _ max: Int) {
            if cur.count == 2 * max {
               ans.append(cur)
               return
            }
            if open < max {
               cur.append("(")
               backtrack(open + 1, close, max)
               cur.removeLast()
            }
            if close < open {
               cur.append(")")
               backtrack(open, close + 1, max)
               cur.removeLast()
            }
        }
        
        backtrack(0, 0, n)
        return ans
    }
    
    func test() {
        print(generateParenthesis(3))
        print(generateParenthesis(1))
    }
}
