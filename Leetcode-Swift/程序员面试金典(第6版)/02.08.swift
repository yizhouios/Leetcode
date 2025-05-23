//
//  02.08.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/18.
//

import Foundation

/*
 面试题 02.08. 环路检测 (中等)
 https://leetcode-cn.com/problems/linked-list-cycle-lcci/
 */

/*
 思路：
 方法一：哈希表
 var detectCycle = function(head) {
     const visited = new Set();
     while (head !== null) {
         if (visited.has(head)) {
             return head;
         }
         visited.add(head);
         head = head.next;
     }
     return null;
 };

 
 方法二：快慢指针
 /**
  * @param {ListNode} head
  * @return {ListNode}
  */
 var detectCycle = function(head) {
     if (head == null) {
         return null;
     }

     let slow = head
     let fast = head
     let meetNode = null
     while (slow && fast && fast.next) {
         slow = slow.next
         fast = fast.next.next
         if (slow == fast) {
             meetNode = slow
             break;
         }
     }

     if (meetNode == null) {
         return null
     }

     slow = head
     while (slow != meetNode) {
         slow = slow.next
         meetNode = meetNode.next
     }
     return slow
 };
 */
