//
//  82.remove-duplicates-from-sorted-list-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/11.
//

import Foundation

/*
 82. 删除排序链表中的重复元素 II (中等)
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
 */

class Solution_82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var head = head
        while head != nil && head?.val == head?.next?.val {
            while head?.val == head?.next?.val {
                head = head?.next
            }
            head = head?.next
        }
        
        if head == nil {
            return nil
        }
        
        var pre = head
        var cur = head?.next
        while cur != nil {
            if cur?.val != cur?.next?.val {
                pre?.next = cur
                pre = cur
                cur = cur?.next
            } else {
                while cur?.val == cur?.next?.val {
                    cur = cur?.next
                }
                cur = cur?.next
            }
        }
        pre?.next = nil
        
        return head
    }
    
    /*
     测试用例：
     1. 功能：仅有1个重复数字（在开头、中间、结尾）；多个重复数字（开头、中间、结尾）；全是重复的数字
     2. 特殊：空链表；仅1个节点
     */
    func test() {
        let tests = """
[1,1,2,3,4,5]
[1,2,2,3,4,5]
[1,2,3,4,5,5]
[1,2,3,3,4,4,5,6,6]
[1,1,2,3,3,4,4,5,6,6]
[1]
[]

[1,1,2,2]
"""
        
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            printListNode(rootNode: deleteDuplicates(createListNode(values: i)))
        }
    }
}

