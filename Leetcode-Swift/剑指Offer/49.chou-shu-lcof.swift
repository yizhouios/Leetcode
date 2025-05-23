//
//  49.chou-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/23.
//

import Foundation

/*
 剑指 Offer 49. 丑数 (中等)
 https://leetcode-cn.com/problems/chou-shu-lcof/
 */

class Solution_Offer_49 {
    func nthUglyNumber(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var ans = [Int](repeating: 0, count: n)
        ans[0] = 1
        var index = 1
        var last2 = (1, 0)
        var last3 = (1, 0)
        var last5 = (1, 0)
        while index < n {
            let nextUgly = min(last2.0 * 2, last3.0 * 3, last5.0 * 5)
            ans[index] = nextUgly
            index += 1
            
            while last2.0 * 2 <= nextUgly {
                last2.1 += 1
                last2.0 = ans[last2.1]
            }
            
            while last3.0 * 3 <= nextUgly {
                last3.1 += 1
                last3.0 = ans[last3.1]
            }
            
            while last5.0 * 5 <= nextUgly {
                last5.1 += 1
                last5.0 = ans[last5.1]
            }
        }
        return ans.last!
    }
    
    /*
     测试用例：
     1. 功能测试：2、3、4、5、6等
     2. 特殊输入测试：0、1
     3. 性能测试：1500等
     */
    func test() {
        let tests = [0,1,2,3,4,5,6,1500]
        for i in tests {
            print(nthUglyNumber(i))
        }
    }
}
