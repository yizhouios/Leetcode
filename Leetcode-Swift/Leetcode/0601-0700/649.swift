//
//  649.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/28.
//

import Foundation

/*
 649. Dota2 参议院 (中等)
 https://leetcode-cn.com/problems/dota2-senate/
 */

class Solution_649 {
    func predictPartyVictory(_ senate: String) -> String {
        if senate.isEmpty {
            return ""
        }
        
        var queueR = [Int]()
        var queueD = [Int]()
        for (index, value) in senate.enumerated() {
            if value == "R" {
                queueR.append(index)
            } else {
                queueD.append(index)
            }
        }
        
        let allMember = senate.count
        while !queueR.isEmpty && !queueD.isEmpty {
            let headR = queueR.removeFirst()
            let headD = queueD.removeFirst()
            if headR < headD {
                queueR.append(headR + allMember)
            } else {
                queueD.append(headD + allMember)
            }
        }
        
        return queueD.isEmpty ? "Radiant" : "Dire"
    }
    
    func test() {
        print(predictPartyVictory("RD"))
        print(predictPartyVictory("RDD"))
        print(predictPartyVictory("RRD"))
    }
}
