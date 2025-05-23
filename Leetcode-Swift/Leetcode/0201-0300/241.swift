//
//  241.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/3.
//

import Foundation

/*
 241. 为运算表达式设计优先级 (中等)
 https://leetcode-cn.com/problems/different-ways-to-add-parentheses/
 */

class Solution_241 {
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if expression.isEmpty {
            return []
        }
        
        if let num = Int(expression) {
            return [num]
        }
        
        let exps = Array(expression)
        let ops: [Character] = ["-", "+", "*"]
        var ans = [Int]()
        for (index, val) in exps.enumerated() {
            if ops.contains(val) {
                let left = diffWaysToCompute(String(exps[0...(index-1)]))
                let right = diffWaysToCompute(String(exps[(index+1)...]))
                for l in left {
                    for r in right {
                        if val == "+" {
                            ans.append(l + r)
                        } else if val == "-" {
                            ans.append(l - r)
                        } else {
                            ans.append(l * r)
                        }
                    }
                }
            }
        }
        
        return ans
    }
//    func diffWaysToCompute(_ expression: String) -> [Int] {
//        if expression.isEmpty {
//            return []
//        }
//
//        let exps = Array(expression)
//        let len = exps.count
//
//        var nums = [Int]()
//        var ops = [Character]()
//
//        var index = 0
//        while index < len {
//            var val = exps[index]
//            if val == "+" || val == "-" || val == "*" {
//                ops.append(val)
//                index += 1
//            } else {
//                var num = 0
//                while index < len {
//                    val = exps[index]
//                    let intVal = Int(val.unicodeScalars.first!.value) - 48
//                    if intVal >= 0 && intVal <= 9 {
//                        num = num * 10 + intVal
//                        index += 1
//                    } else {
//                        break
//                    }
//                }
//                nums.append(num)
//            }
//        }
//
//        let numLen = nums.count
//        let opLen = ops.count
//
//        func recursiveCompute(_ numIndex: Int, _ opIndex: Int) -> [Int] {
//            if numIndex >= numLen {
//                return []
//            }
//
//            // 没有运算符
//            if opIndex >= opLen {
//                return [nums[numIndex]]
//            }
//
//            var ans = [Int]()
//            // 情况1: 两个数先相加
//            let num1 = nums[numIndex]
//            let num2 = nums[numIndex + 1]
//            let op1 = ops[opIndex]
//
//            let remainSums1 = recursiveCompute(numIndex + 1, opIndex + 1)
//            if !remainSums1.isEmpty {
//                for val in remainSums1 {
//                    if op1 == "+" {
//                        ans.append(num1 + val)
//                    } else if op1 == "-" {
//                        ans.append(num1 - val)
//                    } else if op1 == "*" {
//                        ans.append(num1 * val)
//                    }
//                }
//            }
//
//            let nextOpIndex = opIndex + 1
//            if <#condition#> {
//                <#code#>
//            }
//
//            // case2
//            var num2 = nums[numIndex + 1]
//            if op1 == "+" {
//                num2 = num1 + num2
//            } else if op1 == "-" {
//                num2 = num1 - num2
//            } else if op1 == "*" {
//                num2 = num1 * num2
//            }
//
//            let op2 = ops[opIndex + 1]
//            let remainSums2 = recursiveCompute(numIndex + 2, opIndex + 2)
//            if !remainSums2.isEmpty {
//                for val in remainSums2 {
//                    if op2 == "+" {
//                        ans.append(num2 + val)
//                    } else if op2 == "-" {
//                        ans.append(num2 - val)
//                    } else if op2 == "*" {
//                        ans.append(num2 * val)
//                    }
//                }
//            }
//
//            return ans
//        }
//
//        print(nums, ops)
//
//        return recursiveCompute(0, 0)
//    }
    
    func test() {
        print(diffWaysToCompute("2-1-1"))
        print(diffWaysToCompute("2*3-4*5"))
        print(diffWaysToCompute("20+300-49*501"))
    }
}
