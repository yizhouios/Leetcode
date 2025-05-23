//
//  16.15.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/4.
//

import Foundation

/*
 面试题 16.15. 珠玑妙算 (简单)
 https://leetcode-cn.com/problems/master-mind-lcci/
 */

class Solution_jindian_1615 {
    func masterMind(_ solution: String, _ guess: String) -> [Int] {
        // 参数校验
        if solution.isEmpty || guess.isEmpty || solution.count != guess.count {
            return []
        }
        
        var mapSo: [Character: Int] = [
            "R": 0,
            "Y": 0,
            "G": 0,
            "B": 0
        ]
        var mapGu = mapSo
        
        var correct = 0
        var fakeCorrect = 0
        
        let soArray = Array(solution)
        let guArray = Array(guess)
        let count = soArray.count
        for i in 0..<count {
            let so = soArray[i]
            let gu = guArray[i]
            if so == gu {
                correct += 1
            } else {
                // 判断当前猜测是否在之前答案中出现过
                if let count = mapSo[gu], count > 0 {
                    fakeCorrect += 1
                    mapSo[gu] = count - 1
                } else {
                    // 如果之前的答案中没出现过，暂时保存猜过的颜色
                    if let count = mapGu[gu] {
                        mapGu[gu] = count + 1
                    }
                }
                
                // 判断当前答案是否在之前的猜测中出现过
                if let count = mapGu[so], count > 0 {
                    fakeCorrect += 1
                    mapGu[so] = count - 1
                } else {
                    // 如果之前的猜测中没出现过，暂时保存当前答案的颜色
                    if let count = mapSo[so] {
                        mapSo[so] = count + 1
                    }
                }
            }
        }
        
        return [correct, fakeCorrect]
    }
}
