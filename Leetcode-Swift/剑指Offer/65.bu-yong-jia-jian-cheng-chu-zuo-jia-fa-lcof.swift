//
//  65.bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/4.
//

import Foundation

/*
 剑指 Offer 65. 不用加减乘除做加法 (简单)
 https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof/
 */

class Solution_Offer_65 {
    func add(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        var sum = 0
        var carry = 0
        repeat {
            sum = a ^ b
            carry = (a & b) << 1
            a = sum
            b = carry
        } while carry != 0
        
        return sum
    }
    
    /*
     测试用例：
     1. 功能：正数、负数、0
     */
    func test() {
        let tests = [
            (-1,-1),
            (-5,0),
            (-5,10),
            (0, 5),
            (2,3),
            (2,-10)
        ]
        
        for i in tests {
            print(add(i.0, i.1))
        }
    }
}
