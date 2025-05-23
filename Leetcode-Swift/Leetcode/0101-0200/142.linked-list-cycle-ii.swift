//
//  142.linked-list-cycle-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/3.
//

import Foundation
/*
 142. 环形链表 II (中等)
 https://leetcode-cn.com/problems/linked-list-cycle-ii/
 */

class Solution142 {
    /*
     思路：
     假设：
     长度a: 链表头到入环点
     长度b: 入环点走一段距离
     长度c: 长度b终点到入环点的距离
     慢指针走过的距离：a + b
     快指针走过的距离：a + b + n(b + c)
     快指针走过的距离是慢指针的两倍：
     2(a + b) = a + b + n(b + c)
     a + b = nb + nc
     a = (n-1)b + nc
     a = c + (n-1)(b+c)
     入口点距离 = 快慢指针相遇点再走c的距离 + (n-1)圈
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head?.next, fast = head?.next?.next
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next?.next
        }
        if slow == nil {
            return nil
        }
        var guardNode = head
        while guardNode !== slow {
            guardNode = guardNode?.next
            slow = slow?.next
        }
        return guardNode
    }
    
    /*
     测试用例：
     1. 有环：1个节点、2个节点、多个节点（环的位置，最左、最右、中间）
     2. 无环：1个节点、2个节点、多个节点
     3. 空
     */
    func test() {
        do {
            let cycleListNode1 = createCycleListNode([1], pos: 0)
            let cycleListNode2 = createCycleListNode([1,2], pos: 0)
            let cycleListNode3 = createCycleListNode([1,2], pos: 1)
            let cycleListNode4 = createCycleListNode([1,2,3], pos: 0)
            let cycleListNode5 = createCycleListNode([1,2,3], pos: 1)
            let cycleListNode6 = createCycleListNode([1,2,3], pos: 2)
            print(detectCycle(cycleListNode1)?.val)
            print(detectCycle(cycleListNode2)?.val)
            print(detectCycle(cycleListNode3)?.val)
            print(detectCycle(cycleListNode4)?.val)
            print(detectCycle(cycleListNode5)?.val)
            print(detectCycle(cycleListNode6)?.val)
        }
        
        do {
            let cycleListNode1 = createCycleListNode([1], pos: -1)
            let cycleListNode2 = createCycleListNode([1,2], pos: -1)
            let cycleListNode3 = createCycleListNode([1,2], pos: -1)
            let cycleListNode4 = createCycleListNode([1,2,3], pos: -1)
            let cycleListNode5 = createCycleListNode([1,2,3], pos: -1)
            let cycleListNode6 = createCycleListNode([1,2,3], pos: -1)
            print(detectCycle(cycleListNode1)?.val)
            print(detectCycle(cycleListNode2)?.val)
            print(detectCycle(cycleListNode3)?.val)
            print(detectCycle(cycleListNode4)?.val)
            print(detectCycle(cycleListNode5)?.val)
            print(detectCycle(cycleListNode6)?.val)
        }
    }
}
