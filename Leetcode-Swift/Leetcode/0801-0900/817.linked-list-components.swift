//
//  817.linked-list-components.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/22.
//

import Foundation

/*
 817. 链表组件 (中等)
 https://leetcode-cn.com/problems/linked-list-components/
 */

class Solution_817 {
    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        if head == nil || nums.isEmpty {
            return 0
        }
        
        var numDict = [Int: Int]()
        for (index, i) in nums.enumerated() {
            numDict[i] = index
        }
        
        var ans = 0
        var node = head
        while node != nil {
            if numDict[node!.val] != nil {
                ans += 1
                while node != nil && numDict[node!.val] != nil {
                    node = node?.next
                }
            } else {
                node = node?.next
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：不存在组件、存在1个（所有元素组合成1个组件、单个元素、多个元素（非所有））或多个组件
     2. 特殊：空链表
     */
    func test() {
        let tests = [
            ([0,1,2,3], [0,1,3]),
            ([0,1,2,3,4], [0,3,1,4]),
            ([0,1,2,3], [5,6]),
            ([0,1,2,3], [0]),
            ([0,1,2,3], [0,1,2,3]),
        ]
        
        for i in tests {
            print(numComponents(createListNode(values: i.0), i.1))
        }
    }
}
