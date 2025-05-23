//
//  1171.remove-zero-sum-consecutive-nodes-from-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/6.
//

import Foundation

/*
 1171. 从链表中删去总和值为零的连续节点 (中等)
 https://leetcode-cn.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
 */

class Solution_1171 {
    // 参照题解：https://leetcode-cn.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/solution/java-hashmap-liang-ci-bian-li-ji-ke-by-shane-34/
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var map = [Int : ListNode]()
        let dummy = ListNode(0)
        dummy.next = head
        
        var sum = 0
        var node: ListNode? = dummy
        while let cur = node {
            sum += cur.val
            map[sum] = cur
            node = node?.next
        }
        sum = 0
        node = dummy
        while let cur = node {
            sum += cur.val
            cur.next = map[sum]?.next
            node = node?.next
        }
        
        return dummy.next
    }
    
    /*
     测试用例：
     1. 功能：全为0、所有元素相加为0、链表（前、中、后）相加为0
     2. 特殊：空链表、仅1个节点且为0
     */
    func test() {

//        printListNode(rootNode: removeZeroSumSublists(createListNode(values: [1,2,3,-4,1,5])))
//        printListNode(rootNode: removeZeroSumSublists(createListNode(values: [-1,0,2,-2,-2,-1,1,2,0])))
        let tests = """
[2,0]
[1,2,3,-4,1,5]

[0,0,0]
[1,2,3,-3,-2,-1]
[1,-1,2,2]
[1,2,3,-3,1]
[1,2,3,2,-2]
[]
[1]
[0]
[1,2,-3,3,1]
[1,2,3,-3,4]
[1,2,3,-3,-2]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            printListNode(rootNode: removeZeroSumSublists(createListNode(values: i)))
        }
    }
}
