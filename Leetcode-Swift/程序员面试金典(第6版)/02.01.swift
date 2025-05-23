//
//  02.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/1/2.
//

import Foundation

/*
 面试题 02.01. 移除重复节点 (简单)
 https://leetcode-cn.com/problems/remove-duplicate-node-lcci/
 */

class Solution_Jindian_0201 {
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }

        var map = [Int: ListNode]()
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head

        var pre = dummy
        var node = head
        while node != nil {
            if let _ = map[node!.val] {
                pre?.next = node?.next
                node = pre?.next
            } else {
                map[node!.val] = node!
                pre = node
                node = node?.next
            }
        }

        return dummy?.next
    }
}
