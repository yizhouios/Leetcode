//
//  382.linked-list-random-node.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/26.
//

import Foundation

/*
 382. 链表随机节点 (中等)
 https://leetcode-cn.com/problems/linked-list-random-node/
 */

class Solution_382 {

    var head: ListNode?
    
    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        self.head = head
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        var count = 0
        var current = head
        var res = 0
        while current != nil {
            count += 1
            if Int.random(in: 1...count) == count {
                res = current!.val
            }
            current = current!.next
        }
        return res
    }
    
    func test() {
        print("fda")
    }
}
