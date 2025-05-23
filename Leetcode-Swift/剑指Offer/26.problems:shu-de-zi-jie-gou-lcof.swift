//
//  26.problems:shu-de-zi-jie-gou-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/8.
//

import Foundation

/*
 剑指 Offer 26. 树的子结构 (中等)
 https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
 */

/*
 思路：
 法一：递归
 法二：迭代
 */
class Solution_Offer_26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        
        return hasSubTree(A, B)
    }
    
    func hasSubTree(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        var has = false
        
        if A != nil && B != nil {
            if A!.val == B!.val {
                has = doesTreeAHaveTreeB(A, B)
            }
            if !has {
                has = hasSubTree(A?.left, B)
            }
            if !has {
                has = hasSubTree(A?.right, B)
            }
        }
        
        return has
    }
    
    func doesTreeAHaveTreeB(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {
            return true
        }
        
        if A == nil {
            return false
        }
        
        if A!.val != B!.val {
            return false
        }
        
        return doesTreeAHaveTreeB(A?.left, B?.left) && doesTreeAHaveTreeB(A?.right, B?.right)
    }
    
    /*
     测试用例：
     1. 功能测试：B是A的子树（B是普通二叉树）、B不是A的子树
     2. 特殊输入测试：B是A的子树(B只要1个节点；B只有左子节点；B只有右子节点)
     */
    func test() {
//        print(isSubStructure(createTreeNode([3,4,5,1,2,nil,nil]), createTreeNode([4,1,nil])))
//        print(isSubStructure(createTreeNode([3,4,5,1,2,nil,nil]), createTreeNode([4,2,nil])))
//
//        print(isSubStructure(createTreeNode([2,nil,nil]), createTreeNode([2,nil,nil])))
//        print(isSubStructure(createTreeNode([3,2,nil,1,nil]), createTreeNode([3,2,nil])))
//        print(isSubStructure(createTreeNode([3,nil,2,nil,1]), createTreeNode([3,nil,2])))
//
//        print(isSubStructure(createTreeNode([3,4,5,1,2,nil,nil]), createTreeNode([3,4,5,1,2,nil,nil])))
        
        print(isSubStructure(createTreeNode([4,2,3,4,5,6,7,8,9,nil,nil,nil,nil,nil,nil]), createTreeNode([4,8,9])))
    }
}
