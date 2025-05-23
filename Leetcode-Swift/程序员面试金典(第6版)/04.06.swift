//
//  04.06.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/15.
//

import Foundation

/*
 面试题 04.06. 后继者 (中等)
 https://leetcode-cn.com/problems/successor-lcci/
 */

/*
 /**
  * Definition for a binary tree node.
  * function TreeNode(val) {
  *     this.val = val;
  *     this.left = this.right = null;
  * }
  */
 /**
  * @param {TreeNode} root
  * @param {TreeNode} p
  * @return {TreeNode}
  */
 var inorderSuccessor = function(root, p) {
     if (root == null) {
         return null
     }

     var stack = []
     var node = root
     var ans = null

     while (node != null || stack.length > 0) {
         while (node != null) {
             stack.push(node)
             node = node.left
         }

         node = stack.pop()

         if (node != p) {
             node = node.right
             continue
         }

         // 来到此处 node == p，寻找node的“下一个”节点

         // 如果node的右子树不为空，那么下一个节点就是右子树的最深左子节点
         if (node.right != null) {
             ans = node.right
             while (ans.left != null) {
                 ans = ans.left
             }
         } else {
             // 来到这里，说明node的右子树为空，下一个节点是栈顶节点
             if (stack.length > 0) {
                 ans = stack[stack.length - 1]
             } else {
                 ans = null
             }
         }
         break
     }

     return ans
 };
 */

