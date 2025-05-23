//
//  28_112.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/13.
//

import Foundation

/*
 112. 路径总和 (简单)
 https://leetcode-cn.com/problems/path-sum/
 */

class Solution_112_3weeksDataStructures {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        // 代表是叶子结点
        if root?.left == nil && root?.right == nil {
            return targetSum == root!.val
        }
        
        return hasPathSum(root?.left, targetSum - root!.val) || hasPathSum(root?.right, targetSum - root!.val)
    }
    
    
    func test() {
        print(hasPathSum(createTreeNode([1,2,3]), 3))
    }
}
