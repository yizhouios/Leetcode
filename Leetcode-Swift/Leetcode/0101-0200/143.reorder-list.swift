//
//  143.reorder-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/15.
//

import Foundation

/*
 143. 重排链表 (中等)
 https://leetcode-cn.com/problems/reorder-list/
 */

class Solution_143 {
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        
        var stack = [ListNode]()
        var node = head
        while node != nil {
            stack.append(node!)
            node = node?.next
        }
        
        var cur = head
        while cur != nil && cur?.next != nil && cur?.next?.next != nil {
            let topNode = stack.removeLast()
            if !stack.isEmpty {
                stack.last!.next = nil
            }
            let nextCur = cur?.next
            cur?.next = topNode
            topNode.next = nextCur
            cur = nextCur
        }
    }
    
    func test() {
        let tests = """
[]
[1]
[1,2]
[1,2,3]
[1,2,3,4]
[1,2,3,4,5]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            let rootNode = createListNode(values: i)
            reorderList(rootNode)
            printListNode(rootNode: rootNode)
        }
    }
}
