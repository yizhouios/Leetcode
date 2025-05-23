//
//  779.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/8.
//

import Foundation

/*
 779. 第K个语法符号 (中等)
 https://leetcode-cn.com/problems/k-th-symbol-in-grammar/
 */

class Solution_779 {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        if n == 1 {
            return 0
        }
        let superVal = kthGrammar(n - 1, (k + 1) / 2)
//        if superVal == 0 {
//            return k % 2 == 1 ? 0 : 1
//        } else {
//            return k % 2 == 1 ? 1 : 0
//        }
        return (1 - k % 2) ^ superVal
    }
    
    func test() {
        print(kthGrammar(1, 1))
        print(kthGrammar(2, 1))
        print(kthGrammar(2, 2))
        print(kthGrammar(3, 3))
        print(kthGrammar(4, 5))
        print(kthGrammar(30, 434991989))
    }
}
