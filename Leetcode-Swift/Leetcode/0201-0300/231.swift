//
//  231.power-of-two.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/18.
//

import Foundation

/*
 231. 2的幂 (简单)
 https://leetcode-cn.com/problems/power-of-two/)
 */

class Solution231 {
    // MARK: - 二进制表示
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n > 0) && (n & (n - 1) == 0)
    }
    
    // MARK: - 判断是否为最大 22 的幂的约数
    func isPowerOfTwo_2(_ n: Int) -> Bool {
        return (n > 0) && ((1 << 30) % n == 0)
    }
}
