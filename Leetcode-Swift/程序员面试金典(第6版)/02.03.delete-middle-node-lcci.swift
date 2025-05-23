//
//  02.03.delete-middle-node-lcci.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/12.
//

import Foundation

/*
 面试题 02.03. 删除中间节点 (简单)
 https://leetcode-cn.com/problems/delete-middle-node-lcci/
 */

/* JavaScript:
 
 /**
  * Definition for singly-linked list.
  * function ListNode(val) {
  *     this.val = val;
  *     this.next = null;
  * }
  */
 /**
  * @param {ListNode} node
  * @return {void} Do not return anything, modify node in-place instead.
  */
 var deleteNode = function(node) {
     if (node == null || node.next == null) {
         return
     }
     node.val = node.next.val
     node.next = node.next.next
 };
 
 */
