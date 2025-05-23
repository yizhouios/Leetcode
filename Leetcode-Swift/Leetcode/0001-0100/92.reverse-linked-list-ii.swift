//
//  92.reverse-linked-list-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/13.
//

import Foundation

/*
 92. 反转链表 II (中等)
 https://leetcode-cn.com/problems/reverse-linked-list-ii/
 */

class Solution_92 {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left == right {
            return head
        }
        
        var leftNode: ListNode? = head
        var rightNode: ListNode? = head
        var preLeftNode: ListNode? = nil
        var nextRightNode: ListNode? = head?.next
        
        var index = 1
        while index < right {
            if index < left {
                preLeftNode = leftNode
                leftNode = leftNode?.next
            }
            if index < right {
                rightNode = rightNode?.next
                nextRightNode = nextRightNode?.next
            }
            index += 1
        }
        
        preLeftNode?.next = nil
        rightNode?.next = nil
        
        let reversedEndNode = leftNode
        var reversedHeadNode: ListNode? = nil
        while leftNode != nil {
            let next = leftNode?.next
            leftNode?.next = reversedHeadNode
            reversedHeadNode = leftNode
            leftNode = next
        }
        
        preLeftNode?.next = reversedHeadNode
        reversedEndNode?.next = nextRightNode
        
        return left == 1 ? reversedHeadNode : head
    }
    
    /*
     测试用例：
     1. 功能：left是头节点、位于中间、结尾；right是头节点、中间、尾节点; left为头结点/right为尾节点
     2. 特殊：空链表；链表只有1个节点；left=right；
     */
    func test() {
        let tests = [
            (createListNode(values: [1,2,3,4,5]), 1, 4),
            (createListNode(values: [1,2,3,4,5]), 2, 4),
            (createListNode(values: [1,2,3,4,5]), 5, 5),
            (createListNode(values: [1,2,3,4,5]), 1, 1),
            (createListNode(values: [1,2,3,4,5]), 1, 2),
            (createListNode(values: [1,2,3,4,5]), 1, 5),
            (createListNode(values: [5]), 1, 1)
        ]
        
        for i in tests {
            printListNode(rootNode: reverseBetween(i.0, i.1, i.2))
        }
    }
}
