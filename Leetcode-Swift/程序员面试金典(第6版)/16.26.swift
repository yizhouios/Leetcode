//
//  16.26.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/19.
//

import Foundation

/*
 面试题 16.26. 计算器 (中等)
 https://leetcode-cn.com/problems/calculator-lcci/
 */

class Solution_Jindian_1626 {
    func calculate(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let chs = Array(s)
        let count = chs.count
        var digits = [Int]()
        var ops = [Character]()
        
        var idx = 0
        while idx < count {
            var ch = chs[idx]
            // 如果是空格，直接跳过
            if ch == " " {
                idx += 1
                continue
            }
            
            // 如果是数字，生成数字，然后入数字栈
            if isDigit(ch) {
                var res = 0
                while isDigit(ch) {
                    let val = Int(ch.unicodeScalars.first!.value - 48)
                    res = res * 10 + val
                    
                    idx += 1
                    if idx == count {
                        break
                    }
                    ch = chs[idx]
                }
                
                digits.append(res)
                continue
            }

            // 如果运算符栈不为空，判断优先级并处理运算符
            while !ops.isEmpty && isPriority(ops.last!, ch) {
                let num1 = digits.removeLast()
                let num2 = digits.removeLast()
                let op = ops.removeLast()
                digits.append(calcluteSum(num2, num1, op: op))
            }
            
            // 将当前的运算符入栈
            ops.append(ch)
            idx += 1
        }
        
        while digits.count >= 2 && !ops.isEmpty {
            let num1 = digits.removeLast()
            let num2 = digits.removeLast()
            let op = ops.removeLast()
            digits.append(calcluteSum(num2, num1, op: op))
        }
        
        return digits.isEmpty ? 0 : digits.first!
    }

    func isDigit(_ ch: Character) -> Bool {
        let unicodeVal = ch.unicodeScalars.first!.value
        return unicodeVal >= 48 && unicodeVal <= 57
    }

    func isPriority(_ op1: Character, _ op2: Character) -> Bool {
        if op1 == "+" || op1 == "-" {
            if op2 == "*" || op2 == "/" { return false }
        }
        
        return true
    }

    func calcluteSum(_ num1: Int, _ num2: Int, op: Character) -> Int {
        if op == "+" { return num1 + num2 }
        if op == "-" { return num1 - num2 }
        if op == "*" { return num1 * num2 }
        if op == "/" { return num1 / num2 }
        return 0
    }
}
