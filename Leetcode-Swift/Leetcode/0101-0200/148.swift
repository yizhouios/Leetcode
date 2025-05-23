//
//  148.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/19.
//

import Foundation

/*
 148. 排序链表 (中等)
 https://leetcode-cn.com/problems/sort-list/
 */

class Solution_148 {
    
    // 使用归并排序思路对链表进行排序(2021/12/26)
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }

        return mergeSort(head)
    }

    // 归并排序：先拆分，后合并
    func mergeSort(_ head: ListNode?) -> ListNode? {
        // 参数校验
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }

        // 利用快慢指针将链表拆分为两个
        var slow = head, fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        let l1 = head
        let l2 = slow?.next
        slow?.next = nil

        return merge(mergeSort(l1), mergeSort(l2))
    }
    
    // 按照升序合并两个链表
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 参数校验
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }

        let dummyNode: ListNode? = ListNode(0)
        var tail = dummyNode

        var l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
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

        // 拼接剩余的节点
        if l1 != nil {
            tail?.next = l1
        }
        if l2 != nil {
            tail?.next = l2
        }

        return dummyNode?.next
    }

    // MARK: - 旧代码
    func sortList_old(_ head: ListNode?) -> ListNode? {
        func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
            let dummyHead = ListNode(0)
            var pre: ListNode? = dummyHead, head1 = head1, head2 = head2
            while head1 != nil && head2 != nil {
                if head1!.val <= head2!.val {
                    pre?.next = head1
                    head1 = head1?.next
                } else {
                    pre?.next = head2
                    head2 = head2?.next
                }
                pre = pre?.next
            }
            if head1 != nil {
                pre?.next = head1
            } else {
                pre?.next = head2
            }
            
            return dummyHead.next
        }
        
        func sort(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
            if head == nil {
                return nil
            }
            if head?.next === tail {
                head?.next = nil
                return head
            }
            var slow = head, fast = head
            while fast !== tail {
                slow = slow?.next
                fast = fast?.next
                if fast !== tail {
                    fast = fast?.next
                }
            }
            let mid = slow
            return merge(sort(head, mid), sort(mid, tail))
        }
        
        return sort(head, nil)
    }
    
    func test() {
        printListNode(rootNode: sortList(createListNode(values: [6,5,4,3,2])))
    }
}
