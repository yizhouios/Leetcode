//
//  02.07.intersection-of-two-linked-lists-lcci.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/1.
//

import Foundation

/*
 面试题 02.07. 链表相交 (简单)
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci/
 */


/// JavaScript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
//var getIntersectionNode = function(headA, headB) {
//    if (headA == null || headB == null) {
//        return null
//    }
//
//    let stackA = []
//    let stackB = []
//
//    let node = headA
//    while (node != null) {
//        stackA.push(node)
//        node = node.next
//    }
//    node = headB
//    while (node != null) {
//        stackB.push(node)
//        node = node.next
//    }
//
//    let ans = null
//    while (stackA.length && stackB.length) {
//        if (stackA[stackA.length - 1] == stackB[stackB.length - 1]) {
//            ans = stackA.pop()
//            stackB.pop()
//        } else {
//            break
//        }
//    }
//
//    return ans
//};
