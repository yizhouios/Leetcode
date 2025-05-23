//
//  43.1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/20.
//

import Foundation

/*
 剑指 Offer 43. 1～n 整数中 1 出现的次数 (困难)
 https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof/
 */

class Solution_Offer_43 {
    func countDigitOne(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        return numberOf1(String(n))
    }
    
    func numberOf1(_ nStr: String) -> Int {
        if nStr.count == 0 || nStr[nStr.startIndex] < "0" || nStr[nStr.startIndex] > "9" {
            return 0
        }
        
        let first = Int(String(nStr.first!))!
        let count = nStr.count
        
        if count == 1 && first == 0 {
            return 0
        }
        if count == 1 && first > 0 {
            return 1
        }
        
        // 假设nStr是：21345
        // numFirstDigit是数字10000~19999的第一位中的数目
        var numFirstDigit = 0
        if first > 1 {
            numFirstDigit = powerBase10(count - 1)
        } else if (first == 1) {
            numFirstDigit = Int(String(Array(nStr)[1...]))! + 1
        }
        
        // numOtherDigits是1346 ~ 21345除第一位之外的数位中的数目
        let numOtherDigits = first * (count - 1) * powerBase10(count - 2) // 2 * 4 * 10^3
        // numRecursive是1~1346中的数目
        let numRecursive = numberOf1(String(Array(nStr)[1...]))
        
        return numFirstDigit + numOtherDigits + numRecursive
    }
    
    func powerBase10(_ n: Int) -> Int {
        if n <= 0 {
            return 1
        }
        var ans = 1
        for _ in 0..<n {
            ans *= 10
        }
        return ans
    }
    
    /*
     测试用例
     1. 功能测试：5、10、55、99等
     2. 边界值测试：0、1
     3. 特殊输入测试：较大的数字，入100000，3155699等
     */
    func test() {
        print(countDigitOne(5))
        print(countDigitOne(10))
        print(countDigitOne(55))
        print(countDigitOne(99))
        print(countDigitOne(0))
        print(countDigitOne(1))
        print(countDigitOne(100000))
        print(countDigitOne(3155699))
        
        print(countDigitOne(12))
    }
}
