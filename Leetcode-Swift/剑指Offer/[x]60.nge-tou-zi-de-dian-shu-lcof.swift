//
//  60.nge-tou-zi-de-dian-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/31.
//

import Foundation

/*
 剑指 Offer 60. n个骰子的点数 (中等)
 https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/
 */

class Solution_Offer_60 {
    
    func dicesProbability(_ n: Int) -> [Double] {
        if n <= 0 {
            return []
        }
        
        let dicesMaxValue = 6
        var pProbabilities = [[Int]](repeating: [Int](repeating: 0, count: dicesMaxValue * n + 1), count: 2)
        
        var flag = 0
        for i in 1...dicesMaxValue {
            pProbabilities[flag][i] = 1
        }

        if n >= 2 {
            for i in 2...n {
                for j in 0..<i {
                    pProbabilities[1 - flag][j] = 0
                }
                
                for k in i...(dicesMaxValue * i) {
                    pProbabilities[1 - flag][k] = 0
                    var j = 1
                    while j <= k && j <= dicesMaxValue {
                        pProbabilities[1 - flag][k] += pProbabilities[flag][k - j]
                        j += 1
                    }
                }
                
                flag = 1 - flag
            }
        }
        
        var ans = [Double]()
        let total = pow(Double(dicesMaxValue), Double(n))
        for i in n...(dicesMaxValue * n) {
            ans.append(Double(pProbabilities[flag][i]) / total)
        }
        return ans
    }
    
    func dicesProbability_recursive(_ n: Int) -> [Double] {
        if n <= 0 {
            return []
        }

        var ans = [Double](repeating: 0, count: 5 * n + 1)
        Probability1(n, &ans)
        for i in 0...(5 * n) {
            ans[i] = ans[i] / pow(6.0, Double(n))
        }
        return ans
    }
    
    func Probability1(_ number: Int, _ sums: inout [Double]) {
        for i in 1...6 {
            Probability2(number, number, i, &sums)
        }
    }
    
    func Probability2(_ original: Int, _ current: Int, _ sum: Int, _ sums: inout [Double]) {
        if current == 1 {
            sums[sum - original] += 1
        } else {
            for i in 1...6 {
                Probability2(original, current - 1, sum + i, &sums)
            }
        }
    }
    
    func test() {
        for i in 1...11 {
            print(dicesProbability(i))
        }
    }
}
