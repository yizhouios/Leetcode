//
//  21_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/17.
//

import Foundation

/*
 21. 合并两个有序链表 (简单)
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/merge-two-sorted-lists/solution/he-bing-liang-ge-you-xu-lian-biao-by-leetcode-solu/
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
class Solution_21_Day20Plan {
    /// 迭代
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let preHead = ListNode(-1)
        var pre: ListNode? = preHead
        var l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                pre?.next = l1
                l1 = l1?.next
            } else {
                pre?.next = l2
                l2 = l2?.next
            }
            pre = pre?.next
        }
        pre?.next = l1 != nil ? l1 : l2
        return preHead.next
    }
    
    /// 递归解法
    func mergeTwoLists_1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if (l1!.val < l2!.val) {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
    func test() {
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,4]), createListNode(values: [1,3,4])))
    }
}
