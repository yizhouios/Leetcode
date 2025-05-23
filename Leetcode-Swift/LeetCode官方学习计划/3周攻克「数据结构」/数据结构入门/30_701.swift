//
//  30_701.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/14.
//

import Foundation

/*
 701. 二叉搜索树中的插入操作 (中等)
 https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/
 */

class Solution_701_3weeksDataStructures {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        
        var pos = root
        while pos != nil {
            if val < pos!.val {
                if pos?.left == nil {
                    pos?.left = TreeNode(val)
                    break
                } else {
                    pos = pos?.left
                }
            } else {
                if pos?.right == nil {
                    pos?.right = TreeNode(val)
                    break
                } else {
                    pos = pos?.right
                }
            }
        }
        
        return root
    }
    
    func test() {
        print(insertIntoBST(createTreeNode([4,2,7,1,3,nil,nil]), 5)?.levelOrder())
    }
}
