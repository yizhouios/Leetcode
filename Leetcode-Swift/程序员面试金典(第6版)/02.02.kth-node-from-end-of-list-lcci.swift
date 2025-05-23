//
//  File.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/11.
//

import Foundation

/*
 面试题 02.02. 返回倒数第 k 个节点 (简单)
 https://leetcode-cn.com/problems/kth-node-from-end-of-list-lcci/
 */

class Solution_Jiandian_02_02 {
    func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
        if head == nil {
            return -1
        }
        
        var k = k
        var fast = head
        while k != 0 {
            fast = fast?.next
            k -= 1
        }
        
        var slow = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow?.val ?? -1
    }
    
    func test() {
        print(kthToLast(createListNode(values: [1,2,3,4,5]), 1))
        print(kthToLast(createListNode(values: [1,2,3,4,5]), 2))
        print(kthToLast(createListNode(values: [1,2,3,4,5]), 3))
        print(kthToLast(createListNode(values: [1,2,3,4,5]), 4))
        print(kthToLast(createListNode(values: [1,2,3,4,5]), 5))
    }
}
