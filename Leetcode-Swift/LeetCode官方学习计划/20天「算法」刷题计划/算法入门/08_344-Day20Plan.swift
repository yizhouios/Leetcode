//
//  344_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/12.
//

import Foundation
// 参照 344.swift

/*
 344. 反转字符串 (简单)
 https://leetcode-cn.com/problems/reverse-string/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/reverse-string/solution/fan-zhuan-zi-fu-chuan-by-leetcode-solution/
 */

class Solution_344_Day20Plan {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    func test() {
        var s: [Character] = ["h","e","l","l","o"]
        reverseString(&s)
        print(s)
        
        s = ["a", "b", "c", "d", "e"]
        reverseString(&s)
        print(s)
    }
}
