//
//  66.gou-jian-cheng-ji-shu-zu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/5.
//

import Foundation

/*
 剑指 Offer 66. 构建乘积数组 (中等)
 https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof/
 */

class Solution_Offer_66 {
    func constructArr(_ a: [Int]) -> [Int] {
        if a.count == 0 {
            return []
        }
        
        let count = a.count
        var beforeIProduct = [Int](repeating: 1, count: count)
        var afterIProduct = [Int](repeating: 1, count: count)
        
        for i in 1...(count - 1) {
            beforeIProduct[i] = a[i - 1] * beforeIProduct[i - 1]
        }
        
        for i in stride(from: count - 2, to: -1, by: -1) {
            afterIProduct[i] = afterIProduct[i + 1] * a[i + 1]
        }
        
        var ans = [Int]()
        for i in 0...(count - 1) {
            ans.append(beforeIProduct[i] * afterIProduct[i])
        }

        return ans
    }
    
    /*
     测试用例：
     1. 功能：数组中包含正数、负数、一个0、多个0
     2. 边界值：数组为空
     */
    func test() {
        let tests = [
            [1,2,3,4,5],
            [1,2,3,4,-5],
            [1,2,3,4,0],
            [1,0,3,0,5]
        ]
        
        for i in tests {
            print(constructArr(i))
        }
    }
}
