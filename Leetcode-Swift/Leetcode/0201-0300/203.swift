//
//  203.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/6.
//

import Foundation

/*
 203. 移除链表元素 (简单)
 https://leetcode-cn.com/problems/remove-linked-list-elements/
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution_203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        // 参数校验
        if head == nil {
            return nil
        }
        
        // 定义哨兵节点
        let guardHead = ListNode(0, head)
        
        // 遍历删除等于val的节点
        var pre: ListNode? = guardHead
        var cur = guardHead.next
        while cur != nil {
            if cur!.val == val {
                pre?.next = cur?.next
                cur = pre?.next
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        
        return guardHead.next
    }
    
    func removeElements_old(_ head: ListNode?, _ val: Int) -> ListNode? {
        // 哨兵元素
        let preHead = ListNode(0, head)
        
        var pre: ListNode? = preHead
        var cur = pre?.next
        while cur != nil {
            if cur!.val == val {
                let newCur = cur?.next
                pre?.next = cur?.next
                cur = newCur
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        return preHead.next
    }
    
    func test() {
        printListNode(rootNode: removeElements(createListNode(values: [1,2,6,3,4,5,6]), 6))
        printListNode(rootNode: removeElements(createListNode(values: [1,2,6,3,4,5,6]), 1))
        printListNode(rootNode: removeElements(createListNode(values: [1]), 1))
    }
}
