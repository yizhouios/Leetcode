//
//  860.lemonade-change.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/14.
//

import Foundation

/*
 860. 柠檬水找零 (简单)
 https://leetcode-cn.com/problems/lemonade-change/
 */

class Solution860 {
    /*
     思路：贪心
     注意：20的票数不用保留
     */
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for i in bills {
            if i == 5 {
                five += 1
            } else if i == 10 {
                guard five > 0 else {
                    return false
                }
                five -= 1
                ten += 1
            } else {
                if five > 0, ten > 0 {
                    five -= 1
                    ten -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func lemonadeChange_old(_ bills: [Int]) -> Bool {
        var moneys = [0, 0, 0]
        for i in bills {
            if i == 5 {
                moneys[0] += 1
            } else if i == 10 {
                guard moneys[0] != 0 else {
                    return false
                }
                moneys[0] -= 1
                moneys[1] += 1
            } else {
                if moneys[0] != 0, moneys[1] != 0 {
                    moneys[0] -= 1
                    moneys[1] -= 1
                    moneys[2] += 1
                } else if moneys[0] > 3 {
                    moneys[0] -= 3
                    moneys[2] += 1
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    /*
     测试用例：
     1. 开始为：5、10、20
     2. 2/多个元素能/不能找零
     3. 空
     */
    func test() {
        print(lemonadeChange([5]))
        print(lemonadeChange([10]))
        print(lemonadeChange([20]))
        print(lemonadeChange([5,10]))
        print(lemonadeChange([5,20]))
        print(lemonadeChange([5,5,10,10]))
        print(lemonadeChange([5,5,5,20]))
        print(lemonadeChange([]))
        
        // leetcode错误用例
        // 1. [5,5,10,20,5,5,5,5,5,5,5,5,5,10,5,5,20,5,20,5]
        print(lemonadeChange([5,5,10,20,5,5,5,5,5,5,5,5,5,10,5,5,20,5,20,5])) // true
    }
}
