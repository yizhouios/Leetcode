//
//  45.ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/21.
//

import Foundation

/*
 剑指 Offer 45. 把数组排成最小的数 (中等)
 https://leetcode-cn.com/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/
 */

class Solution_Offer_45 {
    func minNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        var nums = nums
        nums.sort { (a, b) -> Bool in
            return (String(a) + String(b)) < (String(b) + String(a))
        }
        let newNums = nums.map { (a) -> String in
            return String(a)
        }
        return newNums.joined(separator: "")
    }
    
    /*
     测试用例：
     1. 功能测试：多个数字；有重复、只有1个
     2. 特殊输入测试：空数组
     */
    func test() {
        print(minNumber([10,2]))
        print(minNumber([3,30,34,5,9]))
        print(minNumber([0,0,1,24,11]))
        print(minNumber([123]))
        print(minNumber([]))
    }
}
