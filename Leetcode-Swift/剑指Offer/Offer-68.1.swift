//
//  68.1.er-cha-sou-suo-shu-de-zui-jin-gong-gong-zu-xian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/6.
//

import Foundation

/*
 剑指 Offer 68 - I. 二叉搜索树的最近公共祖先 (简单)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-zui-jin-gong-gong-zu-xian-lcof/
 
 本题与主站 235 题相同：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

class Solution_Offer_68_1 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        
        if root === p || root === q {
            return root
        }
        
        let rootValue = root!.val
        let pValue = p!.val
        let qValue = q!.val
        
        if rootValue > pValue && rootValue > qValue {
            return lowestCommonAncestor(root?.left, p, q)
        }
        
        if rootValue < pValue && rootValue < qValue {
            return lowestCommonAncestor(root?.right, p, q)
        }
        
        return root
    }
    
    func test() {
        let tests = [
            [6,2,8,0,4,7,9,nil,nil,3,5,nil,nil,nil,nil]
        ]
        
        for i in tests {
            let root = createTreeNode(i)
            print(lowestCommonAncestor(root, root?.left, root?.right)?.val)
            print(lowestCommonAncestor(root, root?.left, root?.left?.right)?.val)
        }
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

     if (root.val > p.val && root.val > q.val) {
         return lowestCommonAncestor(root.left, p, q)
     }

     if (root.val < p.val && root.val < q.val) {
         return lowestCommonAncestor(root.right, p, q)
     }

     return root
    };
 */
