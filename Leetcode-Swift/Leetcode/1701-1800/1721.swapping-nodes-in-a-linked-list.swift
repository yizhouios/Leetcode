//
//  1721.swapping-nodes-in-a-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/19.
//

import Foundation

/*
 1721. 交换链表中的节点 (中等)
 https://leetcode-cn.com/problems/swapping-nodes-in-a-linked-list/
 */

class Solution_1721 {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        var kthNode = head
        var reversedKthNode = head
        var preKthNode: ListNode? = nil
        var preReversedKthNode: ListNode? = nil
        
        var fastForKthNode = head
        var index = k
        var count = 1
        while index > 1 {
            preKthNode = kthNode
            kthNode = kthNode?.next
            fastForKthNode = fastForKthNode?.next
            
            index -= 1
            count += 1
        }
        
        while fastForKthNode?.next != nil {
            fastForKthNode = fastForKthNode?.next
            preReversedKthNode = reversedKthNode
            reversedKthNode = reversedKthNode?.next
            
            count += 1
        }
        
        if kthNode === reversedKthNode {
            return head
        }
        
        if k == count || reversedKthNode?.next === kthNode {
            var tmpNode = kthNode
            kthNode = reversedKthNode
            reversedKthNode = tmpNode
            
            tmpNode = preKthNode
            preKthNode = preReversedKthNode
            preReversedKthNode = tmpNode
        }
        
        if k == 1 || k == count {
            preReversedKthNode?.next = kthNode
            reversedKthNode?.next = kthNode?.next
            kthNode?.next = nil
            return reversedKthNode
        } else if (kthNode?.next === reversedKthNode || reversedKthNode?.next === kthNode) {
            preKthNode?.next = reversedKthNode
            kthNode?.next = reversedKthNode?.next
            reversedKthNode?.next = kthNode

            return head
        } else {
            preReversedKthNode?.next = reversedKthNode?.next
            preKthNode?.next = kthNode?.next
            reversedKthNode?.next = preKthNode?.next
            preKthNode?.next = reversedKthNode
            kthNode?.next = preReversedKthNode?.next
            preReversedKthNode?.next = kthNode
            
            return head
        }
    }
    
    /*
     测试用例：
     1. 功能：仅1个节点、交换头和尾（仅包含2个元素，多个元素）、交换相邻（仅包含2个元素，多个元素）、交换其他位的节点
     2. 特殊：空链表
     */
    func test() {
        let tests = [
            ([1], 1),
            ([1,2,3,4,5], 1),
            ([1,2,3,4,5], 5),
            ([1,2,4,5], 2),
            ([1,2,3,4,5], 2),
            ([7,9,6,6,7,8,3,0,9,5], 3),
            ([], 1),

            ([1,2], 1),
            ([1,2], 2),
            ([1,2,3,4], 2),
            ([1,2,3,4], 3),
        ]
        
        for i in tests {
            printListNode(rootNode: swapNodes(createListNode(values: i.0), i.1))
        }
    }
}
