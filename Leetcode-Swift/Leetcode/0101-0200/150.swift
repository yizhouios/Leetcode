//
//  150.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/21.
//

import Foundation

/*
 150. 逆波兰表达式求值 (中等)
 https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/
 */

class Solution_150 {
    func evalRPN(_ tokens: [String]) -> Int {
        if tokens.isEmpty {
            return 0
        }
        var stack = [Int]()
        let operators = [ "+" : true, "-": true, "*": true, "/": true ]
        var index = 0
        let count = tokens.count
        while index < count {
            let token = tokens[index]
            if operators[token] != nil {
                let token2 = stack.popLast()!
                let token1 = stack.popLast()!
                var res = 0
                if token == "+" {
                    res = token1 + token2
                } else if token == "-" {
                    res = token1 - token2
                } else if token == "*" {
                    res = token1 * token2
                } else if token == "/" {
                    res = token1 / token2
                }
                stack.append(res)
            } else {
                stack.append(Int(token)!)
            }
            index += 1
        }
        
        return stack.isEmpty ? 0 : stack.first!
    }
    
    func test() {
        print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
        print(evalRPN(["4","13","5","/","+"]))
        print(evalRPN(["2","1","+","3","*"]))
    }
}
