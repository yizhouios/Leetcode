//
//  17.da-yin-cong-1dao-zui-da-de-nwei-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/1.
//

import Foundation

/*
 剑指 Offer 17. 打印从1到最大的n位数 (简单)
 https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/
 */

class Solution_Offer_17 {
    
    /// 下列为leetcode题目解法
    func printNumbers_1(_ n: Int) -> [Int] {
        return [Int](1 ..< Int(pow(10, Double(n))))
    }
    /// 下列为leetcode题目解法
    func printNumbers_2(_ n: Int) -> [Int] {
        var ans = [Int]()
        for i in 1..<Int(pow(10, Double(n))) {
            ans.append(i)
        }
        return ans
    }
    
    /// 下列为书中的迭代解法（打印数字；且考虑大数问题）
    func printNumbers_1(_ n: Int) {
        if n <= 0 {
            return
        }
        
        func _increment(_ numbers: inout [Character]) -> Bool {
            var isOverflow = false
            var carry = 0 // 进位
            let unicodeValueOfZero = Int("0".unicodeScalars.first!.value)
            for i in stride(from: numbers.count - 1, to: -1, by: -1) {
                var nSum = Int(numbers[i].unicodeScalars.first!.value) - unicodeValueOfZero + carry
                if i == numbers.count - 1 {
                    nSum += 1
                }
                if nSum >= 10 {
                    if i == 0 {
                        isOverflow = true
                    } else {
                        nSum -= 10
                        carry = 1
                        numbers[i] = Character("\(nSum)")
                    }
                } else {
                    numbers[i] = Character("\(nSum)")
                    break
                }
            }
            
            return isOverflow
        }
        
        func _printNumbers(_ numbers: [Character]) {
            var isBegin = false
            let numbers = numbers.filter { (value) -> Bool in
                if value == "0" && !isBegin {
                    return false
                }
                isBegin = true
                return true
            }
            if numbers.count > 0 {
                print(String(numbers))
            }
        }
        
        var numbers = [Character](repeating: "0", count: n)
        while !_increment(&numbers) {
            _printNumbers(numbers)
        }
    }
    
    /// 下列为书籍中全排列思路的递归解法（代码更简洁）
    func printNumbers(_ n: Int) {
        if n <= 0 {
            return
        }
        
        func _printNumbers(_ numbers: [Character]) {
            var isBegin = false
            let numbers = numbers.filter { (value) -> Bool in
                if value == "0" && !isBegin {
                    return false
                }
                isBegin = true
                return true
            }
            if numbers.count > 0 {
                print(String(numbers))
            }
        }
        
        func _print1to9DigitsRecursively(_ numbers: inout [Character], _ index: Int) {
            if index >= numbers.count {
                _printNumbers(numbers)
                return
            }
            for char in "0123456789" {
                numbers[index] = char
                _print1to9DigitsRecursively(&numbers, index + 1)
            }
        }
        
        
        var numbers = [Character](repeating: "0", count: n)
        _print1to9DigitsRecursively(&numbers, 0)
    }
    
    /*
     测试用例:
     1. 功能测试：1、2、3等
     2. 特殊输入测试：-1、0
     */
    func test() {
//        printNumbers(1)
//        printNumbers(2)
        printNumbers(5)
//        print(printNumbers(4))
//
//        print(printNumbers(-1))
//        print(printNumbers(0))
    }
}
