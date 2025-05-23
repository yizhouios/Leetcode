//
//  29_700.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/14.
//

import Foundation

/*
 700. 二叉搜索树中的搜索 (简单)
 https://leetcode-cn.com/problems/search-in-a-binary-search-tree/
 */

class Solution_700_3weeksDataStructures {
    /// 迭代
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var root = root
        while root != nil && root!.val != val {
            root = root!.val > val ? root?.left : root?.right
        }
        return root
    }
    
    /// 递归
    func searchBST_1(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let rootVal = root!.val
        if rootVal == val {
            return root
        }
        
        return rootVal > val ? searchBST(root?.left, val) : searchBST(root?.right, val)
    }
    
    func test() {
        print(searchBST(createTreeNode([4,2,7,1,3,6,8]), 2)?.levelOrder())
    }
}
