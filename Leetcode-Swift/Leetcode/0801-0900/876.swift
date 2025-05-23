//
//  876.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/7.
//

import Foundation

/*
 876. 链表的中间结点 (简单)
 https://leetcode-cn.com/problems/middle-of-the-linked-list/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/middle-of-the-linked-list/solution/lian-biao-de-zhong-jian-jie-dian-by-leetcode-solut/
 */

class Solution_876 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        // 快慢指针
        var slow = head, fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    func test() {
        printListNode(rootNode: middleNode(createListNode(values: [1,])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3,4])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3,4,5])))
    }
}
