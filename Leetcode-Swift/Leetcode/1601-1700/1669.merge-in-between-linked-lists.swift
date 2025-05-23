//
//  1669.merge-in-between-linked-lists.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/8.
//

import Foundation

/*
 1669. 合并两个链表 (中等)
 https://leetcode-cn.com/problems/merge-in-between-linked-lists/
 */

class Solution_1669 {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var preNodeA: ListNode?
        var nextNodeB: ListNode?
        
        var index = 0
        var cur = list1
        while cur != nil {
            if index == a - 1 {
                preNodeA = cur
            } else if (index == b) {
                nextNodeB = cur?.next
                break
            }
            cur = cur?.next
            index += 1
        }
        
        let headNodeList2 = list2
        var tailNodeList2 = list2
        while tailNodeList2?.next != nil {
            tailNodeList2 = tailNodeList2?.next
        }
        
        var ans = list1
        if preNodeA == nil {
            if headNodeList2 == nil {
                ans = nextNodeB
            } else {
                ans = headNodeList2
                tailNodeList2?.next = nextNodeB
            }
        } else {
            if headNodeList2 == nil {
                preNodeA?.next = nextNodeB
            } else {
                preNodeA?.next = headNodeList2
                tailNodeList2?.next = nextNodeB
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：删除list1的前、中、后部分、删除全部list1节点 -> list2位空、仅1个节点、多个节点
     2. 特殊：list1为空或list2为空
     */
    func test() {
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 2, createListNode(values: [1000000,1000001,1000002])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 3, 4, createListNode(values: [1000000,1000001,1000002])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 4, 5, createListNode(values: [1000000,1000001,1000002])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 5, createListNode(values: [1000000,1000001,1000002])))
        
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 2, createListNode(values: [1000000])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 3, 4, createListNode(values: [1000000])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 4, 5, createListNode(values: [1000000])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 5, createListNode(values: [1000000])))
        
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 2, createListNode(values: [])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 3, 4, createListNode(values: [])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 4, 5, createListNode(values: [])))
        printListNode(rootNode: mergeInBetween(createListNode(values: [0,1,2,3,4,5]), 0, 5, createListNode(values: [])))
        
        printListNode(rootNode: mergeInBetween(createListNode(values: []), 0, 5, createListNode(values: [1000000,1000001,1000002])))
    }
}
