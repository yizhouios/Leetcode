//
//  1019.next-greater-node-in-linked-lis.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/24.
//

import Foundation

/*
 1019. 链表中的下一个更大节点 (中等)
 https://leetcode-cn.com/problems/next-greater-node-in-linked-list/
 */

class Solution_1019 {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        
        var ans = [Int]()
        var nodes = [Int]()
        
        var node = head
        while node != nil {
            nodes.append(node!.val)
            node = node?.next
        }
        
        var window = [Int]()
        window.append(nodes.removeLast())
        ans.append(0)
        
        while !nodes.isEmpty {
            let lastVal = nodes.removeLast()
            while !window.isEmpty && window.first! <= lastVal {
                window.removeFirst()
            }
            if window.isEmpty {
                ans.insert(0, at: 0)
            } else {
                ans.insert(window.first!, at: 0)
            }
            window.insert(lastVal, at: 0)
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：递增、递减、错乱
     2. 特殊：空链表、仅1个节点
     */
    func test() {
        let tests = """
1,2,3,4,5
5,4,3,2,1
1,2,3,2,1
[2,1,5]
[2,7,4,3,5]
[1,7,5,1,9,2,5,1]
[1]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            print(nextLargerNodes(createListNode(values: i)))
        }
    }
}
