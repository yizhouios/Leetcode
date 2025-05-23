//
//  06_82_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/24.
//

import Foundation

/*
 82. 删除排序链表中的重复元素 II (中等)
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
 */

class Solution_06_82_Day20Plan {
    /// 一次遍历
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var head = head
        var cur = head
        var pre: ListNode? = nil
        
        while cur != nil {
            if cur?.val == cur?.next?.val {
                while cur?.val == cur?.next?.val {
                    cur = cur?.next
                }
                if pre != nil {
                    pre?.next = cur?.next
                } else {
                    head = cur?.next
                }
            } else {
                pre = cur
            }
            cur = cur?.next
        }
        
        return head
    }
    
    func test() {
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,2,3,3,4,4,5])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,1,2,3])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,1,2,2,3])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,1,2,2,3,3])))
    }
}
