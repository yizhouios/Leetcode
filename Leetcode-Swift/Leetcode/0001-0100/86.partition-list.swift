//
//  86.partition-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/12.
//

import Foundation

/*
 86. 分隔链表 (中等)
 https://leetcode-cn.com/problems/partition-list/
 */

class Solution_86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var ans = head
        var lastTransferedNode: ListNode? = nil
        var pre: ListNode? = nil
        var cur = head
        
        while cur != nil {
            if cur!.val < x {
                if lastTransferedNode == nil {
                    lastTransferedNode = cur
                    if pre != nil {
                        pre?.next = cur?.next
                        cur = cur?.next
                        lastTransferedNode?.next = head
                        ans = lastTransferedNode
                    } else {
                        pre = cur
                        cur = cur?.next
                        ans = head
                    }
                } else {
                    if lastTransferedNode?.next === cur {
                        pre = cur
                        lastTransferedNode = cur
                        cur = cur?.next
                    } else {
                        let tmpNode = cur
                        pre?.next = cur?.next
                        cur = cur?.next
                        
                        tmpNode?.next = lastTransferedNode?.next
                        lastTransferedNode?.next = tmpNode
                        lastTransferedNode = tmpNode
                    }
                }
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：小于x的节点都在前面；都在后面；前后都有；所有节点没有小于x的
     2. 特殊：空链表；只有1个节点
     */
    func test() {
        let tests = [
            (createListNode(values: [1,4,3,2,5,2]), 10),
            (createListNode(values: [1,4,3,2,5,2]), -1),
            (createListNode(values: [4,5,6,3,2,1]), 4),
            (createListNode(values: [1,4,3,2,5,2]), 3),
            (createListNode(values: [2,1]), 2),
            (createListNode(values: [1]), 2),
        ]
        
        for i in tests {
            printListNode(rootNode: partition(i.0, i.1))
        }
    }
}
