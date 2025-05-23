//
//  160.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/11.
//

import Foundation

/*
 160. 相交链表 (简单)
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 */

class Solution_160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        // 参数校验
        if headA == nil || headB == nil {
            return nil
        }
        
        // 特殊判断
        if headA === headB {
            return headA
        }
        
        var l1 = headA
        var l2 = headB
        let m = listCount(headA)
        let n = listCount(headB)
        
        if m >= n {
            for _ in 0..<(m - n) {
                l1 = l1?.next
            }
        } else {
            for _ in 0..<(n - m) {
                l2 = l2?.next
            }
        }
        
        while l1 != nil && l2 != nil {
            if l1 === l2 {
                return l1
            }
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return nil
    }

    func listCount(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        
        var head = head
        var count = 0
        while head != nil {
            count += 1
            head = head?.next
        }
        return count
    }
}
