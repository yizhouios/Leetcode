//
//  68.2.er-cha-shu-de-zui-jin-gong-gong-zu-xian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/6.
//

import Foundation

/*
 剑指 Offer 68 - II. 二叉树的最近公共祖先 (简单)
 https://leetcode-cn.com/problems/er-cha-shu-de-zui-jin-gong-gong-zu-xian-lcof/
 
 本题与主站 236 题相同：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */

class Solution_Offer_68_2 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        return left == nil ? right : (right == nil ? left : root)
    }
    
    func test() {
        print("fda")
    }
}

/*
 JavaScript:
 
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
  * @param {TreeNode} q
  * @return {TreeNode}
  */
  var lowestCommonAncestor = function(root, p, q) {
     if (root == null || p == null || q == null) {
         return null
     }
     if (root == p || root == q) {
         return root
     }
     let left = lowestCommonAncestor(root.left, p, q)
     let right = lowestCommonAncestor(root.right, p, q)
     return left == null ? right : (right == null ? left : root)
 };
 */
