//
//  15.er-jin-zhi-zhong-1de-ge-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/30.
//

import Foundation

/*
 剑指 Offer 15. 二进制中1的个数 (简单)
 https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/
 */

/*
 思路
 1. 通过一个flag（初始值为1），依次左移，来判断数字的每一位上是否为1（缺点就是二进制有多少位遍历多少次）
 2. 使用 (n - 1) & n 每次去除最左侧的1，直到n为0
 */
class Solution_Offer_15 {
    
    /// O(二进制中1的个数)
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var ans = 0
        // 对负数先做个处理
        if n < 0 {
            ans = 1
            n &= 0b01111111111111111111111111111111
        }
        while n != 0 {
            ans += 1
            n = (n - 1) & n // 去除最右侧的1
        }
        return ans
    }
    
    /// O(二进制的位数)
    func hammingWeight_1(_ n: Int) -> Int {
        var ans = 0
        var flag = 1
        while flag != 0 {
            if n & flag != 0 {
                ans += 1
            }
            flag <<= 1
        }
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：正数/负数有1、奇数/偶数有1
     2. 边界值测试：0、负数最大、正数最大
     3. 特殊测试：仅1个1、全是1
     
     正数边界值 1、0x7FFFFFFF
     负数边界值：0x80000000、0xFFFFFFFF
     */
    func test() {
        print(Int32.min)
        print(Int32.max)
        
        print(hammingWeight(-3))
        print(hammingWeight(3))
        print(hammingWeight(-6))
        print(hammingWeight(6))
        
        print(hammingWeight(0))
        print(hammingWeight(-2147483648))
        print(hammingWeight(2147483647))
        
        print(hammingWeight(1))
        print(hammingWeight(0b11111111111111111111111111111111))
    }
}
