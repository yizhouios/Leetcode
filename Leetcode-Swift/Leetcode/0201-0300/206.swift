//
//  2.reverse-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/3.
//

import Foundation

/*
 206. 反转链表（简单）
 https://leetcode-cn.com/problems/reverse-linked-list/
 */

class Solution_206 {
    // 递归解法：
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let last: ListNode? = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    // 迭代解法
    func reverseList_iteration(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var pre: ListNode?
        var cur = head
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        
        return pre
    }
    
    func test() {
        let node5 = ListNode(5)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        let node1: ListNode? = ListNode(1, node2)

        printListNode(rootNode: node1)

        let su = Solution_206()
        let newRootNode = su.reverseList_iteration(node1)
        print(newRootNode!.val)
        printListNode(rootNode: newRootNode)
    }
    
    func testCase() {
        /*
         1. 一个、多个节点
         2. 空
         */
    }
}
