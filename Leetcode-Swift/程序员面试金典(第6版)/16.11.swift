//
//  16.11.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 面试题 16.11. 跳水板 (简单)
 https://leetcode-cn.com/problems/diving-board-lcci/
 */

class Solution_jindian_1611 {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        // 校验k的值
        if k <= 0 {
            return []
        }
        
        // 校验shorter和longer
        if shorter == longer {
            return [shorter * k]
        }
        
        // 总弄有k+1种结果
        var ans = [Int](repeating: 0, count: k + 1)
        // 第1个为全都是短木板
        ans[0] = shorter * k
        
        // 依次减去短木板并增加长木板
        var last = ans[0]
        for i in 1..<(k+1) {
            last -= shorter
            last += longer
            ans[i] = last
        }
        
        return ans
    }
    
    func test() {
        print(divingBoard(1, 1, 0))
        print(divingBoard(3, 3, 2))
        print(divingBoard(3, 4, 3))
    }
}
