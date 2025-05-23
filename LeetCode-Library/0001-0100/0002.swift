//
//  0002.swift
//  LeetCode-Library
//
//  Created by yizhou on 2025/5/23.
//

import Foundation

/*
 2. 两数相加
 https://leetcode-cn.com/problems/add-two-numbers/
 */

public class Solution_0002 : NSObject {
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 参数校验
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }

        var l1 = l1
        var l2 = l2
        let guardNode = ListNode()
        var tail: ListNode? = guardNode
        
        // 对应的位相加，并生成新节点，计算进位
        var carry = 0
        while l1 != nil && l2 != nil {
            // 计算和
            var sum = l1!.val + l2!.val + carry
            // 计算进位
            carry = sum >= 10 ? 1 : 0
            // 更新和
            if carry == 1 {
                sum -= 10
            }
            let node = ListNode(sum)
            tail?.next = node
            tail = tail?.next
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        // 拼接剩余的节点
        var remainNode = l1 == nil ? l2 : l1
        while remainNode != nil {
            // 如果不需要进位，直接拼接到最后
            if carry == 0 {
                tail?.next = remainNode
                break
            }
            
            // 计算和
            var sum = remainNode!.val + carry
            // 计算进位
            carry = sum >= 10 ? 1 : 0
            // 更新和
            if carry == 1 {
                sum -= 10
            }
            
            tail?.next = ListNode(sum)
            tail = tail?.next
            remainNode = remainNode?.next
        }
        
        // 判断是否还有进位
        if carry > 0 {
            tail?.next = ListNode(carry)
        }
        
        return guardNode.next
    }
}
