//
//  328.odd-even-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/17.
//

import Foundation

/*
 328. 奇偶链表 (中等)
 https://leetcode-cn.com/problems/odd-even-linked-list/
 */

class Solution_328 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let oddHeadNode: ListNode? = ListNode(0)
        var oddTailNode = oddHeadNode
        let evenHeadNode: ListNode? = ListNode(0)
        var evenTailNode = evenHeadNode
        
        var cur = head
        var val = 1
        while cur != nil {
            let tmp = cur?.next
            cur?.next = nil
            
            if val % 2 == 0 {
                evenTailNode?.next = cur
                evenTailNode = cur
            } else {
                oddTailNode?.next = cur
                oddTailNode = cur
            }

            cur = tmp
            val += 1
        }
        
        oddTailNode?.next = evenHeadNode?.next
        
        return oddHeadNode?.next
    }
    
    func oddEvenList_old(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var oddEndNode = head
        var pre = head
        var cur = head?.next
        var index = 2
        while cur != nil {
            if index & 1 == 1 {
                let next = cur?.next
                pre?.next = next
                cur?.next = oddEndNode?.next
                oddEndNode?.next = cur
                oddEndNode = cur
                cur = next
            } else {
                pre = cur
                cur = cur?.next
            }
            
            index += 1
        }
        
        return head
    }
    
    /*
     测速用例
     1. 功能：节点数是奇数、偶数、1/2/3个节点
     2. 特殊：空链表
     */
    func test() {
        let tests = """
[]
[1]
[1,2]
[1,2,3]
[1,2,3,4]
[1,2,3,4,5]
[2,1,3,5,6,4,7]
[5,4,3,2,1]
[3,2,10,1]
[2,1]
[4,2,1,3]
[-1,5,3,4,0]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            let rootNode = createListNode(values: i)
            printListNode(rootNode: oddEvenList(rootNode))
        }
    }
}
