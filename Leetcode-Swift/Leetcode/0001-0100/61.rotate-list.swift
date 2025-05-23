//
//  61.rotate-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/10.
//

import Foundation
/*
 61. 旋转链表 (中等)
 https://leetcode-cn.com/problems/rotate-list/
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
class Solution_61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k <= 0 {
            return head
        }
        
        var allNodes = [ListNode]()
        var node = head
        while node != nil {
            allNodes.append(node!)
            node = node?.next
        }
        
        let count = allNodes.count
        let k = k % count
        if k == 0 {
            return head
        }
            
        var cur = count - 1
        let end = count - k
        var head = head
        while cur >= end {
            let newEndNode = allNodes[cur - 1]
            let newHeadNode = allNodes[cur]
            newEndNode.next = nil
            newHeadNode.next = head
            head = newHeadNode
            
            cur -= 1
        }
        
        return head
    }
    
    /*
     测试用例
     1. 功能：k=1、2、链表的长度、大于链表的长度
     2. 特殊：空链表、k小于等于0
     */
    func test() {
        let tests = [
            (createListNode(values: [1,2,3,4,5]), 1),
            (createListNode(values: [1,2,3,4,5]), 2),
            (createListNode(values: [1,2,3,4,5]), 5),
            (createListNode(values: [1,2,3,4,5]), 13),
            (nil, 5),
            (createListNode(values: [0,1,2]), 4),
            (createListNode(values: [0,1,2]), -4)
        ]
        
        for i in tests {
            printListNode(rootNode: rotateRight(i.0, i.1))
        }
    }
}
