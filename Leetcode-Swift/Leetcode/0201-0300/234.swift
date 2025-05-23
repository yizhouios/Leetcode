//
//  234.palindrome-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/11.
//

import Foundation

/*
 234. 回文链表 (简单)
 https://leetcode-cn.com/problems/palindrome-linked-list/
 */

/*
 思路：
 思路1. 利用数组/栈/队列，保存前半部分的值，然后再遍历后半部分， 看是否相等
 思路2. 不需要额外的辅助空间，翻转前半部分链表
 */
class Solution_234 {
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        
        // 计算节点的个数
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        
        // 寻找第二部分的起始节点并翻转
        let startIndex = count / 2 + (count & 1)
        var beginNode = head
        for _ in 0..<startIndex {
            beginNode = beginNode?.next
        }
        
        // 依次判断是否相等
        var l1 = head
        var l2 = reverseList(beginNode)
        while l1 != nil && l2 != nil {
            if l1!.val != l2!.val {
                return false
            }
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return true
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var pre: ListNode?
        var cur = head
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        return pre
    }
    
    func isPalindrome_1(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var count = 0
        var node = head
        var allVals = [Int]()
        while node != nil {
            count += 1
            allVals.append(node!.val)
            node = node?.next
        }
        
        if allVals.count == 1 {
            return true
        }
        
        let mid = count / 2
        for i in 0..<mid {
            if allVals[i] != allVals[count - i - 1] {
                return false
            }
        }
        
        return true
    }
    
    /*
     测试用例：
     1. 功能：仅有1个节点、2个及多个节点【是/不是】回文链表
     2. 特殊：空链表
     */
    func test() {
        let tests = """
[1]
[1,1]
[1,2]
[1,2,3,2,1]
[1,2,3,3,1]
[]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            print(isPalindrome(createListNode(values: i)))
        }
    }
}
