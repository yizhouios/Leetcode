//
//  25.he-bing-liang-ge-pai-xu-de-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/8.
//

import Foundation

/*
 剑指 Offer 25. 合并两个排序的链表 (简单)
 https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/
 */

class Solution_Offer_25 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 参数校验
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        // 创建哨兵节点
        let guardNode = ListNode(0)
        // 尾节点
        var tail: ListNode? = guardNode
        var l1 = l1
        var l2 = l2
        // 依次往尾节点插入较小的元素
        while l1 != nil, l2 != nil {
            if l1!.val <= l2!.val {
                tail?.next = l1
                tail = tail?.next
                l1 = l1?.next
            } else {
                tail?.next = l2
                tail = tail?.next
                l2 = l2?.next
            }
        }
        
        // 连接剩余的节点
        if l1 != nil {
            tail?.next = l1
        }
        if l2 != nil {
            tail?.next = l2
        }
        
        return guardNode.next
    }
    
    /*
     测试用例：
     1. 功能测试：两个链表都有值（一个多一个少；两个一样多）、l1或l2其中一个为空
     2. 特殊输入测试：两个都为空
     */
    func test() {
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), nil))
        printListNode(rootNode: mergeTwoLists(nil, createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3,4,5]), createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), createListNode(values: [1,2,3,4,5,6])))
        
        printListNode(rootNode: mergeTwoLists(nil, nil))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1]), createListNode(values: [1])))
    }
}
