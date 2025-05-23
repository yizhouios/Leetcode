//
//  27.er-cha-shu-de-jing-xiang-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/9.
//

import Foundation

/*
 剑指 Offer 27. 二叉树的镜像 (简单)
 https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof/
 */

class Solution_Offer_27 {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil || (root?.left == nil && root?.right == nil) {
            return root
        }
        
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        
        if root?.left != nil {
            let _ = mirrorTree(root?.left)
        }
        if root?.right != nil {
            let _ = mirrorTree(root?.right)
        }
        return root
    }
    
    /*
     测试用例：
     1. 功能测试：普通二叉树；只有左子节点的二叉树；只有右子节点的二叉树
     2. 特殊输入测试：空树；只有1个节点
     */
    func test() {
        print(mirrorTree(createTreeNode([4,2,7,1,3,6,9]))?.levelOrder() ?? [])
        print(mirrorTree(createTreeNode([1,2,nil,3,nil,4,nil]))?.levelOrder() ?? [])
        print(mirrorTree(createTreeNode([1,nil,2,nil,3,nil,4]))?.levelOrder() ?? [])
        
        print(mirrorTree(createTreeNode([1,nil,nil]))?.levelOrder() ?? [])
        print(mirrorTree(nil)?.levelOrder() ?? [])
    }
}
