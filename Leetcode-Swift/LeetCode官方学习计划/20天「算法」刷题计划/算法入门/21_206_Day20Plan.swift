//
//  206_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/17.
//

import Foundation

/*
 206. 反转链表 (简单)
 https://leetcode-cn.com/problems/reverse-linked-list/
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
class Solution_206_Day20Plan {
    /// 递归
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    /// 迭代
    func reverseList_1(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var pre: ListNode? = nil, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
    
    func test() {
        printListNode(rootNode: reverseList(createListNode(values: [1,2,3])))
        printListNode(rootNode: reverseList(createListNode(values: [1,2])))
        printListNode(rootNode: reverseList(createListNode(values: [1])))
    }
}
