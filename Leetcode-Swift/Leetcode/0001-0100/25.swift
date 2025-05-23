//
//  25.reverse-nodes-in-k-group.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/4.
//

import Foundation

/*
 25. K 个一组翻转链表 (困难)
 https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
 */

class Solution25 {
    
    func reverseKGroup_2021_1211(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        // 定义虚拟头节点
        let virtualHead: ListNode? = ListNode(0)
        // 定义尾节点，每次往尾节点进行拼接
        var tail = virtualHead
        
        // p代表单个group的头节点；q代表单个group的尾节点
        var p = head, q = head
        var val = 1
        while q != nil {
            if val == k {
                // 保存q?.next（下一个group的头节点）
                let tmp = q?.next
                // 截断当前的group
                q?.next = nil
                // 翻转当前的group
                let (p1, q1) = reverse_2021_1211(p)
                // 拼接
                tail?.next = p1
                tail = q1
                // 重新寻找下一个group
                p = tmp
                q = tmp
                val = 1
            } else {
                q = q?.next
                val += 1
            }
        }
        
        // 如果有未翻转的（即不足k个的情况，保持原有顺序，拼接到尾节点）
        if p != nil {
            tail?.next = p
        }
        
        return virtualHead?.next
    }

    /// 翻转链表(头插法)
    /// - Parameter head: 链表的头指针
    /// - Returns: 元组（头节点，尾节点）
    func reverse_2021_1211(_ head: ListNode?) -> (ListNode?, ListNode?) {
        if head == nil {
            return (nil, nil)
        }
        
        var virtualHead: ListNode? = nil
        
        var cur = head
        while cur != nil {
            let tmp = cur?.next
            cur?.next = virtualHead
            virtualHead = cur
            cur = tmp
        }
        
        return (virtualHead, head)
    }
    
    // MARK: - 以下为旧实现
    func reverse(_ head: ListNode?, tail: ListNode?) -> (head: ListNode?, tail: ListNode?) {
        var pre = tail?.next, cur = head
        while pre !== tail {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return (tail, head)
    }
    
    // 思路：迭代
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 哨兵节点
        let hair = ListNode(0)
        hair.next = head
        var pre: ListNode? = hair
        
        var mutHead = head
        while mutHead != nil {
            var tail = pre
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil {
                    return hair.next
                }
            }
            let nextHead = tail?.next
            let (tmpHead, tmpTail) = reverse(mutHead, tail: tail)
            pre?.next = tmpHead
            tmpTail?.next = nextHead
            pre = tmpTail
            mutHead = nextHead
        }
        
        return hair.next
    }
    
    // 思路：递归
    func reverseKGroup_recursive(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        var anotherHead = head
        while anotherHead != nil {
            count += 1
            anotherHead = anotherHead?.next
            
            if count == k {
                break
            }
        }
        if count != k {
            return head
        }
        
        var pre: ListNode? = nil, cur = head, index = 0
        while index < k {
            let tmp = cur
            cur = cur?.next
            tmp?.next = pre
            pre = tmp
            
            index += 1
        }

        head?.next = reverseKGroup_recursive(anotherHead, k)
        return pre
    }
    
    /*
     测试用例：
     1. 翻转个数小于总节点数：1个、2个、全部，恰好无剩余，有剩余
     2. 空
     */
    func test() {
        printListNode(rootNode: reverseKGroup(createListNode(values: [1,2,3,4,5,6,7,8]), 1))
        printListNode(rootNode: reverseKGroup(createListNode(values: [1,2,3,4,5,6,7,8]), 2))
        printListNode(rootNode: reverseKGroup(createListNode(values: [1,2,3,4,5,6,7,8]), 3))
        printListNode(rootNode: reverseKGroup(createListNode(values: [1,2,3,4,5,6,7,8]), 4))
        printListNode(rootNode: reverseKGroup(createListNode(values: [1,2,3,4,5,6,7,8]), 8))
        printListNode(rootNode: reverseKGroup(nil, 8))
    }
}
