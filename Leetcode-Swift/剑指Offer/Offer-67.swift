//
//  67.ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/5.
//

import Foundation

/*
 剑指 Offer 67. 把字符串转换成整数 (中等)
 https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof/submissions/
 */

class Solution_Offer_67 {
    func strToInt(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        
        let chars = Array(str)
        var sign = 1
        let n = str.count
        var index = 0
        
        // 寻找第一个非空字符
        while index < n && chars[index] == " " {
            index += 1
        }
        
        // 如果全是空格
        if index == n {
            return 0
        }
        
        // 判断是否是正负符号
        if chars[index] == "-" {
            sign = -1
            index += 1
        } else if chars[index] == "+" {
            index += 1
        }
        
        var ans = 0
        // 溢出判定值（如果大于这个值，就不用继续转换后面的值）
        let sentryVal = Int32.max / 10
        let unicodeValOf0 = "0".unicodeScalars.first!.value
        let unicodeValOf9 = "9".unicodeScalars.first!.value
        let lastValOfIntMax = Int32.max % 10
        let lastValOfIntMin = Int32.min % 10 * -1
        while index < n {
            // 判断是否是0~9
            let charVal = chars[index].unicodeScalars.first!.value
            if charVal < unicodeValOf0 || charVal > unicodeValOf9 {
                break
            }
            
            // 当前的字符转为正数
            let val = Int(charVal - unicodeValOf0)
            
            // 判断是否即将溢出
            if ans > sentryVal {
                return Int(sign > 0 ? Int32.max : Int32.min)
            }
            if (ans == sentryVal) {
                if sign > 0 && val > lastValOfIntMax {
                    return Int(Int32.max)
                }
                if sign < 0 && val > lastValOfIntMin {
                    return Int(Int32.min)
                }
            }
            
            // 计算本次的值
            ans = ans * 10 + val
            index += 1
        }
        
        return sign * ans
    }
    
    /*
     测试用例：
     1. 功能：带正负号；0；前后有空格
     2. 特殊：仅1个空格；全是空格；有非数字的字符
     3. 边界值：最大值、最小值
     */
    func test() {
        let tests = [
            " ",
            "   ",
            "  -42  ",
            "words and 987",
            "+110words and 987",
            "-91283472332"
        ]
        
        for i in tests {
            print(strToInt(i))
        }
    }
}
