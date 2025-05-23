//
//  227.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/24.
//

import Foundation

/*
 227. 基本计算器 II (中等)
 https://leetcode-cn.com/problems/basic-calculator-ii/
 */

class Solution_227 {
    func calculate(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let items = Array(s)
        let count = items.count
        var index = 0
        
        var stackNum = [Int]()
        var stackOp = [Character]()
        let ops: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]
        
        while index < count {
            let item = items[index]
            if item == " " {
                index += 1
            } else if (item == "+" || item == "-" || item == "*" || item == "/") {
                if !stackOp.isEmpty {
                    let curOpLevel = ops[item]!
                    while !stackOp.isEmpty && ops[stackOp.last!]! >= curOpLevel {
                        let topOp = stackOp.removeLast()
                        let num1 = stackNum.removeLast()
                        let num2 = stackNum.removeLast()
                        if topOp == "+" || topOp == "-" {
                            stackNum.append(topOp == "-" ? num2 - num1 : num2 + num1)
                        } else {
                            stackNum.append(topOp == "*" ? num2 * num1 : num2 / num1)
                        }
                    }
                }
                stackOp.append(item)
                index += 1
            } else {
                var sum = 0
                while index < count {
                    let value = Int(items[index].unicodeScalars.first!.value) - 48
                    if value >= 0 && value <= 9 {
                        sum = sum * 10 + value
                        index += 1
                    } else {
                        break
                    }
                }
                stackNum.append(sum)
            }
        }
        
        while !stackOp.isEmpty {
            let topOp = stackOp.removeLast()
            let num1 = stackNum.removeLast()
            let num2 = stackNum.removeLast()
            if topOp == "+" {
                stackNum.append(num2 + num1)
            } else if topOp == "-" {
                stackNum.append(num2 - num1)
            } else if topOp == "*" {
                stackNum.append(num2 * num1)
            } else {
                stackNum.append(num2 / num1)
            }
        }
        
        return stackNum.last!
    }
    
    /*
     测试用例：
     1. 功能测试：仅+、仅-、仅*、仅/、四个运算符都包含、大数
     2. 特殊测试：含空格、空字符串
     */
    func test() {
//        print(calculate("3+2"))
//        print(calculate(" 3-2 "))
//        print(calculate(" 3*2 "))
//        print(calculate(" 3/2 "))
//        print(calculate("1+2-1*100/20"))
//        print(calculate(""))
//        print(calculate("   1 +   1000342"))
        
        // leetcode
        print(calculate("1-1+1"))
        print(calculate("1*2-3/4+5*6-7*8+9/10")) // -24
    }
}
