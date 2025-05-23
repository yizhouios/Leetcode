//
//  20.biao-shi-shu-zhi-de-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/7.
//

import Foundation

/*
 剑指 Offer 20. 表示数值的字符串 (中等)
 https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
 */

class Solution_Offer_20 {
    func isNumber(_ s: String) -> Bool {
        let chars = Array(s.trimmingCharacters(in: .whitespaces))
        let count = chars.count
        
        if count == 0 {
            return false
        }
        var index = 0
        var isNumeric = false
        
        // 搜索整数
        if chars[index] == "+" || chars[index] == "-" {
            index += 1
            index = scanInteger(chars, index)
            isNumeric = index > 1
        } else {
            index = scanInteger(chars, index)
            isNumeric = index > 0
        }
        
        // 搜索小数
        // 1. 小数可以没有整数部分 .33
        // 2. 小数点后面可以没有数字 233.
        // 3. 小数点前后可以都有数字 2.2
        if index < count && chars[index] == "." {
            index += 1
            let tmpIndex = index
            index = scanInteger(chars, index)
            isNumeric = isNumeric || index > tmpIndex
        }
        
        // 搜索指数部分 e/E后必须有数字
        if index < count && (chars[index] == "e" || chars[index] == "E") {
            index += 1
            var tmpIndex = index
            if index < count {
                if chars[index] == "+" || chars[index] == "-" {
                    index += 1
                    tmpIndex = index
                }
                index = scanInteger(chars, index)
            }
            isNumeric = isNumeric && index > tmpIndex
        }
        return isNumeric && index == count
    }
    
    func scanInteger(_ chars: [Character], _ beginIndex: Int) -> Int {
        let zeroToNine: ClosedRange<Character> = "0"..."9"
        var index = beginIndex
        while index < chars.count {
            if zeroToNine.contains(chars[index]) {
                index += 1
            } else {
                break
            }
        }
        return index
    }
    
    /*
     测试用例：
     1. 功能测试：整数（正/负）、小数、e/E、正数+小数、正数+e/E、小数+e/E；前面的数包含/不包含空格
     2. 边界值测试：0
     3. 特殊输入测试：+、-、.、e、E、
     
     书中测试用例：
     1. 功能测试：正数或负数；包含或不包含整数部分的数值；包含或者不包含小数部分的数值；包含或者不包含指数部分的数值；各种不能表达有效数值的字符串
     2. 特殊输入测试：空串
     */
    func test() {
        print(isNumber("234"))
        print(isNumber("+234"))
        print(isNumber("-234"))
        
        print(isNumber("1.2"))
        print(isNumber("-1.2"))
        print(isNumber(".2"))
        
        print(isNumber("10.2e10 "))
        print(isNumber(" 10.2e-10"))
        print(isNumber(" 10.2e+10  "))
        print(isNumber("10.2E10"))
        print(isNumber("10.2E-10"))
        print(isNumber("10.2E+10"))
        
        print(isNumber("0"))
        
        print(isNumber("+"))
        print(isNumber("-"))
        print(isNumber("+."))
        print(isNumber("+324.e"))
        print(isNumber(".3e"))
    }
}
