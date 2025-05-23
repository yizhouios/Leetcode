//
//  36.er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/14.
//

import Foundation

/*
 剑指 Offer 36. 二叉搜索树与双向链表 (中等)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/

 参考页末javaascript解法
 */

class Solution_Offer_36 {
    func test() {
        
    }
}

/*
 // javascript: 非递归
 var treeToDoublyList = function(root) {
     if (root == null) {
         return null
     }

     let dummyNode = new Node(0, null, null)
     var tail = dummyNode

     var node = root
     var stack = []

     while ((node != null) || (stack.length > 0)) {
         while (node != null) {
             stack.push(node)
             node = node.left
         }

         node = stack.pop()
         let right = node.right
         tail.right = node
         node.left = tail
         node.right = null
         tail = node

         node = right
     }

     tail.right = dummyNode.right
     dummyNode.right.left = tail
     dummyNode.right = null

     return tail.right
 };
 */

/*
 // javascript: 递归
 var treeToDoublyList = function(root) {
     if (root == null) {
         return null
     }

     let dummyNode = new Node(0, null, null)
     var tail = dummyNode
     var obj = {
         tail
     }

     inorder(root, obj)

     tail = obj.tail
     tail.right = dummyNode.right
     dummyNode.right.left = tail
     dummyNode.right = null

     return tail.right
 };

 var inorder = function(root, tailObj) {
     if (root == null) {
         return
     }

     let left = root.left
     let right = root.right

     inorder(left, tailObj)

     var tail = tailObj.tail
     tail.right = root
     root.left = tail
     root.right = null
     tailObj.tail = root

     inorder(right, tailObj)
 }
 */
