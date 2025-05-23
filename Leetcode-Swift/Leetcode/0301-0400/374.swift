//
//  374.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/28.
//

import Foundation

/*
 374. 猜数字大小 (简单)
 https://leetcode-cn.com/problems/guess-number-higher-or-lower/
 */

/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if the picked number is lower than your guess number
 *                  1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class GuessGame {
    static var randomVal: Int = 0
    
    func guess(_ num: Int) -> Int {
        let pick = GuessGame.randomVal
        if pick < num { return -1 }
        if pick > num { return 1 }
        return 0
    }
}

class Solution_374 : GuessGame {
    // 二分查找
    func guessNumber(_ n: Int) -> Int {
        var low = 1
        var high = n
        
        while low <= high {
            let mid = low + (high - low) / 2
            let guessRes = guess(mid)
            
            if guessRes == 0 {
                return mid
            } else if guessRes > 0 {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return -1
    }
}
