//
//  224.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/23.
//

import Foundation

/*
 224. 基本计算器 (困难)
 https://leetcode-cn.com/problems/basic-calculator/
 */

class Solution_224 {
    func calculate(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        var ans = 0
        var stack = [1]
        var sign = 1
        
        let items = Array(s)
        let count = items.count
        var index = 0
        
        while index < count {
            if items[index] == " " {
                index += 1
            } else if items[index] == "+" {
                sign = stack.last!
                index += 1
            } else if items[index] == "-" {
                sign = -stack.last!
                index += 1
            } else if items[index] == "(" {
                stack.append(sign)
                index += 1
            } else if items[index] == ")" {
                stack.removeLast()
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
                ans += sign * sum
            }
        }
        
        return ans
    }
    
    func test() {
        print(calculate("1-(-1 - 1)"))
        print(calculate("1+(-1 - 1)"))
        print(calculate("1000 + 1"))
        print(calculate(" 2-1 + 2 "))
        print(calculate("(1+(4+5+2)-3)+(6+8)"))
    }
}
