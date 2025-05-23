//
//  64.qiu-12n-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/4.
//

import Foundation

/*
 剑指 Offer 64. 求1+2+…+n (中等)
 https://leetcode-cn.com/problems/qiu-12n-lcof/
 */

class Solution_Offer_64 {
    func sumNums(_ n: Int) -> Int {
        func recursiveForTerminator(_ n: Int) -> Int {
            return n
        }
        
        func recursive(_ n: Int) -> Int {
            let funcs: [Bool: (Int) -> Int] = [true: recursiveForTerminator(_:), false: recursive(_:)]
            return n + funcs[n == 1]!(n - 1)
        }
        
        return recursive(n)
    }
    
    func test() {
        let tests = [
            3,9,10000
        ]
        
        for i in tests {
            print(sumNums(i))
        }
    }
}
