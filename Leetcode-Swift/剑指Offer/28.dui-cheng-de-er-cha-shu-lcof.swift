//
//  28.dui-cheng-de-er-cha-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/9.
//

import Foundation

/*
 剑指 Offer 28. 对称的二叉树 (简单)
 https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/
 */

class Solution_Offer_28 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return _isSymmetric(root?.left, root?.right)
    }
    
    func _isSymmetric(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        if root1 == nil || root2 == nil {
            return false
        }
        if root1!.val != root2!.val {
            return false
        }
        
        return _isSymmetric(root1?.left, root2?.right) && _isSymmetric(root1?.right, root2?.left)
    }
    
    /*
     测试用例：
     1. 功能测试：对称二叉树；结构不对称二叉树；结构对称但节点值不对称的二叉树
     2. 特殊输入测试：空树；只有1个节点的二叉树；所有节点都相同的二叉树
     */
    func test() {
        print(isSymmetric(createTreeNode([1,2,2,3,4,4,3])))
        print(isSymmetric(createTreeNode([1,2,2,nil,3,nil,3])))
        print(isSymmetric(createTreeNode([1,2,2,3,4,5,3])))
        print(isSymmetric(nil))
        print(isSymmetric(createTreeNode([1,nil,nil])))
        print(isSymmetric(createTreeNode([1,1,1,1,1,1,1])))
    }
}
