//
//  44.shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/20.
//

import Foundation

/*
 剑指 Offer 44. 数字序列中某一位的数字 (中等)
 https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof/
 */

class Solution_Offer_44 {
    func findNthDigit(_ n: Int) -> Int {
        if n < 0 {
            return -1
        }
        
        var digits = 1
        var n = n
        while true {
            let numbers = countOfIntegers(digits)
            if n < numbers * digits {
                return digitAtIndex(n, digits)
            }
            n -= numbers * digits
            digits += 1
        }
    }
    
    func countOfIntegers( _ digits: Int) -> Int {
        if digits == 1 {
            return 10
        }
        var ans = 1
        for _ in 0..<(digits - 1) {
            ans *= 10
        }
        return ans * 9
    }
    
    func digitAtIndex(_ index: Int, _ digits: Int) -> Int {
        var beginNumber = 0
        if digits > 1 {
            beginNumber = 1
            for _ in 0..<(digits - 1) {
                beginNumber *= 10
            }
        }
        
        var number = beginNumber + index / digits
        let indexFromRight = digits - index % digits
        for _ in 1..<indexFromRight {
            number /= 10
        }
        return number % 10
    }
    
    /*
     测试用例：
     1.功能测试：10、190、1000等
     2.特殊输入测试：0、1
     */
    func test() {
        print(findNthDigit(10))
        print(findNthDigit(190))
        print(findNthDigit(1000))
        print(findNthDigit(1001))
        print(findNthDigit(0))
        print(findNthDigit(1))
    }
}
