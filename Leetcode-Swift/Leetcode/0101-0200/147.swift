//
//  147.insertion-sort-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/16.
//

import Foundation

/*
 147. 对链表进行插入排序 (中等)
 https://leetcode-cn.com/problems/insertion-sort-list/
 */

class Solution_147 {

    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }

        // 默认头节点已经在排序后的链表中
        let dummyNode: ListNode? = ListNode(0, head)
        var p = head?.next
        head?.next = nil

        while p != nil {
            // 保存下一个待排序的节点
            let tmp = p?.next

            // 从已排序的链表中查找插入位置
            var cur = dummyNode
            let val = p!.val
            while cur?.next != nil && cur!.next!.val < val {
                cur = cur?.next
            }
            // cur?.next即为插入位置
            p?.next = cur?.next
            cur?.next = p

            // p指向下一个待排序的节点
            p = tmp
        }

        return dummyNode?.next
    }
    
    /*
     测速用例
     1. 功能：全有序；仅1或2个节点有序或无序；全倒序；错乱序
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
[5,4,3,2,1]
[3,2,10,1]
[2,1]
[4,2,1,3]
[-1,5,3,4,0]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            let rootNode = createListNode(values: i)
            printListNode(rootNode: insertionSortList(rootNode))
        }
    }
}
