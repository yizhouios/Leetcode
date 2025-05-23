//
//  09_986_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/25.
//

import Foundation

/*
 986. 区间列表的交集 (中等)
    
 */

class Solution_09_986_Day20Plan {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        var i = 0, j = 0
        let firstLisLen = firstList.count
        let secondListLen = secondList.count
        while i < firstLisLen && j < secondListLen {
            let firstLeft = firstList[i][0], firstRight = firstList[i][1]
            let secondLeft = secondList[j][0], secondRight = secondList[j][1]
            let left = firstLeft > secondLeft ? firstLeft : secondLeft
            let right = firstRight < secondRight ? firstRight : secondRight
            if left <= right {
                ans.append([left, right])
            }
            
            if firstRight < secondRight {
                i += 1
            } else {
                j += 1
            }
        }
        
        return ans
    }
    
    func test() {
        print(intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]]))
        print(intervalIntersection([[1,3], [5,9]], []))
    }
}
