//
//  338.counting-bits.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/18.
//

import Foundation

/*
 338. 比特位计数 (中等)
 https://leetcode-cn.com/problems/counting-bits/
 */

/*
 * 思路1：遍历每个数，然后调用191题的解法
 * 思路2：遍历每个数，利用当前数移除左右侧的1后的值为索引，从计算过的数组中获取1的数量，然后再+1
 */
class Solution338 {
    func countBits(_ num: Int) -> [Int] {
        var ans = [0]
        if num != 0 {
            for i in 1...num {
                ans.append(ans[i & (i - 1)] + 1)
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 奇数；偶数
     2. 0
     */
    func test() {
        print(countBits(3))
        print(countBits(5))
        print(countBits(6))
        print(countBits(10))
        print(countBits(0))
    }
}
