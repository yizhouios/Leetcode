//
//  24..swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/3.
//

import Foundation
/*
 24. 两两交换链表中的节点 (中等)
 https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 */

class Solution24 {
    /*
     思路 迭代：
     依次遍历，每次cur指向下一对的第一个节点，并用last保存上一对转换后的第二个节点（用来连接新的一对）
     1. 保存下一对的第一个节点
     2. last指向cur.next，连接上新的一对节点
     3. 交换当前对的指向
     4. 调到1重复执行
     */
    func swapPairs_iteration(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let resHead = head?.next
        var newHead = head
        var last: ListNode? = nil
        while newHead?.next != nil {
            let cur = newHead
            newHead = newHead?.next?.next
            if last != nil {
                last?.next = cur?.next
            }
            cur?.next?.next = cur
            cur?.next = newHead
            last = cur
        }
        return resHead
    }
    
    // 递归解法
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let second = head
        let newHead = head?.next
        second?.next = swapPairs(head?.next?.next)
        newHead?.next =  second
        return newHead
    }
    
    /*
     测试用例：
     1. 节点数：奇数个、偶数个、1个
     2. 空
     */
    func test() {
        printListNode(rootNode: swapPairs(nil))
        printListNode(rootNode: swapPairs(createListNode(values: [1])))
        printListNode(rootNode: swapPairs(createListNode(values: [1,2])))
        printListNode(rootNode: swapPairs(createListNode(values: [1,2,3])))
        printListNode(rootNode: swapPairs(createListNode(values: [1,2,3,4])))
    }
}

