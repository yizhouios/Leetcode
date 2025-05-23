//
//  7.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/7/2.
//

import Foundation

/*
 7. 整数反转 (中等)
 https://leetcode.cn/problems/reverse-integer/
 */

class Solution_7 {
    // MARK: - 提前判断是否将要溢出（优化）
    // 参考: https://leetcode.cn/problems/reverse-integer/solution/zheng-shu-fan-zhuan-by-leetcode-solution-bccn/
    func reverse(_ x: Int) -> Int {
        // Int32.max: 2147483647
        // Int32.min: -2147483648
        var x = x
        var ans = 0
        while x != 0 {
            if ans < (Int32.min / 10) || ans > (Int32.max / 10) {
                return 0
            }
            
            let endNum = x % 10
            x /= 10
            ans = ans * 10 + endNum
        }

        return ans
    }
    
    // MARK: - 提前判断是否将要溢出
    // 参考: https://leetcode.cn/problems/reverse-integer/solution/tu-jie-7-zheng-shu-fan-zhuan-by-wang_ni_ma/
    func reverse_v2(_ x: Int) -> Int {
        // Int32.max: 2147483647
        // Int32.min: -2147483648
        var x = x
        var ans = 0
        while x != 0 {
            let endNum = x % 10

            if ans < (Int32.min / 10) || ans > (Int32.max / 10) {
                return 0
            }

            // 当ans等于如下两种情况时，判断要加的数字（⚠️下面的两段判断可以不加，当ans == (Int32.min / 10)或ans == (Int32.max / 10)，endNum只可能<=2）
            if ans == (Int32.min / 10) && endNum < -8 {
                return 0
            }
            if ans == (Int32.max / 10) && endNum > 7 {
                return 0
            }

            x /= 10
            ans = ans * 10 + endNum
        }

        return ans
    }
}
