//
//  18.shan-chu-lian-biao-de-jie-dian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/2.
//

import Foundation

/*
 剑指 Offer 18. 删除链表的节点 (简单)
 https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/
 */

class Solution_Offer_18 {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        if head!.val == val {
            return head?.next
        }
        var preNode = head
        var curNode = head?.next
        
        while curNode != nil, curNode?.val != val {
            preNode = curNode
            curNode = curNode?.next
        }
        preNode?.next = curNode?.next
        return head
    }
    
    /// 书中的题目的解法
    func DeleteNode( _ head: inout ListNode?, _ toBeDeleted: ListNode?) {
        if head == nil || toBeDeleted == nil {
            return
        }
        // 要删除的不是尾节点
        if toBeDeleted?.next != nil {
            toBeDeleted!.val = toBeDeleted!.next!.val
            toBeDeleted?.next = toBeDeleted?.next?.next
        }
        // 链表只有1个节点
        else if (unsafeBitCast(head, to: UnsafeRawPointer.self) == unsafeBitCast(toBeDeleted, to: UnsafeRawPointer.self)) {
            head = nil
        }
        // 要删除的是尾节点
        else {
            var node = head
            while node != nil && unsafeBitCast(node?.next, to: UnsafeRawPointer.self) != unsafeBitCast(toBeDeleted, to: UnsafeRawPointer.self) {
                node = node?.next
            }
            node?.next = nil
        }
    }
    
    /*
     测试用例：
     1. 功能测试：可正常删除节点
     2. 边界值测试：删除的节点是头结点、尾结点
     3. 特殊输入测试：空节点
     */
    func test() {
        let l1 = createListNode(values: [4,5,1,9])
        printListNode(rootNode: deleteNode(l1, 5))
        let l2 = createListNode(values: [4,5,1,9])
        printListNode(rootNode: deleteNode(l2, 1))
        
        let l3 = createListNode(values: [4,5,1,9])
        printListNode(rootNode: deleteNode(l3, 4))
        let l4 = createListNode(values: [4,5,1,9])
        printListNode(rootNode: deleteNode(l4, 9))
        
        printListNode(rootNode: deleteNode(nil, 3))
        
        var l5 = createListNode(values: [1])
        DeleteNode(&l5, l5)
        printListNode(rootNode: l5)
        
        var l6 = createListNode(values: [1,2,3])
        DeleteNode(&l6, l6?.next?.next)
        printListNode(rootNode: l6)
        
        var l7 = createListNode(values: [1,2,3])
        DeleteNode(&l7, l7)
        printListNode(rootNode: l7)
    }
}
