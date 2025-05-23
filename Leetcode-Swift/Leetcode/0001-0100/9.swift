//
//  9.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/1.
//

import Foundation

/*
 9. 回文数 (简单)
 https://leetcode-cn.com/problems/palindrome-number/
 */

class Solution_9 {
    /*
     优化
     */
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x > 0) {
            return false
        }
        var (x, m, n) = (x, 0, 0)
        while x > m {
            n = x % 10
            m = m * 10 + n
            x /= 10
        }

        return x == m || x == m / 10
    }
    
    func isPalindrome_self(_ x: Int) -> Bool {
        // 如果是小数，直接返回false
        if x < 0 {
            return false
        }
        
        // 如果是0，直接返回true
        if x == 0 {
            return true
        }
        
        // 拆解每位上的数字
        var array = [Int]()
        var x = x
        while x > 9 {
            let newItem = x - x / 10 * 10
            array.append(newItem)
            x /= 10
        }
        array.append(x)
        
        // 判断回文
        var left = 0
        var right = array.count - 1
        while left < right {
            if array[left] != array[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func test() {
        /*
         测试用例：
         1. -111、-11、-1
         2. 0
         3. 123、121、11
         */
        print(isPalindrome(-111))
        print(isPalindrome(-11))
        print(isPalindrome(-1))
        print(isPalindrome(0))
        print(isPalindrome(123))
        print(isPalindrome(121))
        print(isPalindrome(11))
        print(isPalindrome(10))
    }
}
