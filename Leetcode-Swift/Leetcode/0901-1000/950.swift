//
//  950.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/31.
//

import Foundation

/*
 950. 按递增顺序显示卡牌 (中等)
 https://leetcode-cn.com/problems/reveal-cards-in-increasing-order/
 */

class Solution_950 {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        if deck.isEmpty {
            return []
        }
        
        let len = deck.count
        var indexes = Array(0..<len)
        let deck = deck.sorted()
        
        var ans = [Int](repeating: 0, count: len)
        for i in deck {
            ans[indexes.removeFirst()] = i
            if !indexes.isEmpty {
                indexes.append(indexes.removeFirst())
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：乱序、递增、递减
     2. 特殊：空数组、仅1个元素
     */
    func test() {
        print(deckRevealedIncreasing([1,2,3,4,5]))
        print(deckRevealedIncreasing([1,3,5,2,4]))
        print(deckRevealedIncreasing([9,7,6,4,3]))
        
        print(deckRevealedIncreasing([]))
        print(deckRevealedIncreasing([1]))
    }
}
