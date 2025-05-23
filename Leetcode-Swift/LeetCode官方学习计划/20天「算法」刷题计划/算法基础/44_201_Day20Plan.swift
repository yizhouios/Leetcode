//
//  44_201_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/9/9.
//

import Foundation

/*
 201. 数字范围按位与 (中等)
 https://leetcode-cn.com/problems/bitwise-and-of-numbers-range/
 */

class Solution_44_201_Day20Plan {
    /// 去除最右侧的1
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var left = left, right = right
        while left < right {
            right = right & (right - 1)
        }
        return right
    }
    
    /// 位移
    func rangeBitwiseAnd_1(_ left: Int, _ right: Int) -> Int {
        var count = 0
        var left = left, right = right
        while left != right {
            left >>= 1
            right >>= 1
            count += 1
        }
        return left << count
    }
    
    func test() {
        // 0b101
        // 0b110
        // 0b111
        print(rangeBitwiseAnd(5, 7))
    }
}
