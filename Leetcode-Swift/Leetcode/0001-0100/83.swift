//
//  83.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/7.
//

import Foundation

/*
 83. 删除排序链表中的重复元素 (简单)
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 */

class Solution_83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // 参数校验
        if head == nil {
            return nil
        }
        
        var cur = head
        while cur != nil {
            while let next = cur?.next, cur!.val == next.val {
                cur?.next = cur?.next?.next
            }
            cur = cur?.next
        }
        
        return head
    }
    
    func test() {
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,2,3,3])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,2])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1])))
    }
}

