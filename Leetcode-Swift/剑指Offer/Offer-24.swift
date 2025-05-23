//
//  24.fan-zhuan-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/8.
//

import Foundation

/*
 剑指 Offer 24. 反转链表 (简单)
 https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
 */

class Solution_Offer_24 {
    // 递归
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        return reverseList_recursive(head).0
    }

    func reverseList_recursive(_ head: ListNode?) -> (ListNode?, ListNode?) {
        if head == nil {
            return (nil, nil)
        }
        if head?.next == nil {
            return (head, head)
        }

        let (newHead, tail) = reverseList_recursive(head?.next)
        head?.next = nil
        tail?.next = head
        return (newHead, head)
    }
    
    // 迭代
    func reverseList_old(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        return pre
    }
    
    /*
     测试用例：
     1. 功能测试：多个节点、仅1个节点
     2. 特殊输入测试：空链表
     */
    func test() {
        printListNode(rootNode: reverseList(createListNode(values: [1,2,3,4,5])))
        printListNode(rootNode: reverseList(createListNode(values: [1])))
        printListNode(rootNode: reverseList(nil))
        
    }
}
