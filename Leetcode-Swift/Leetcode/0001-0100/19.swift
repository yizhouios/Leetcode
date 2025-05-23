//
//  19.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/11.
//

import Foundation

/*
 19. 删除链表的倒数第 N 个结点 (中等)
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/solution/shan-chu-lian-biao-de-dao-shu-di-nge-jie-dian-b-61/
 */

class Solution_19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        // 定义虚拟头节点
        let virtualNode: ListNode? = ListNode(0)
        virtualNode?.next = head
        
        // 快指针先走n步
        var fast = virtualNode
        var n = n
        while n > 0 && fast != nil {
            fast = fast?.next
            n -= 1
        }
        
        if fast == nil {
            return head
        }
        
        // 慢指针从头开始
        var slow = virtualNode
        // 快慢指针一同前进
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        // slow?.next即为要删除的节点
        slow?.next = slow?.next?.next
        
        return virtualNode?.next
    }
    
    func removeNthFromEnd_old(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 哑节点，next指向head，可减少对head的特殊判断
        var dummy: ListNode? = ListNode(0, head)
        
        var fast = head
        var slow = dummy
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        dummy = dummy?.next
        return dummy
    }
    
    func test() {
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 1))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 2))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 3))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 4))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 5))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1]), 1))
    }
}
